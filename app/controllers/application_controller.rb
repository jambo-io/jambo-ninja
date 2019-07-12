class ApplicationController < ActionController::Base
       
  protect_from_forgery with: :exception
  #Prevent CSRF attacks by raising exception.
  #For APIs, you may want to use :null_session instead.
  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [{ user_profile_attributes: [:name, :lastname,
    :phone, :birthday, :address, :city, :state, :administrative_region_id] }])
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  # Devise
  def after_sign_up_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def after_sign_in_path_for(resource)
    @evento_id = params[:eventosbahai_id]
    if(@evento_id.present?)
        if(current_user.participants.where(eventosbahai_id: @evento_id).present?)
          participant_path(current_user.participants.where(eventosbahai_id: @evento_id).first)
        else
          confirm_registration_path(Eventosbahai.find(@evento_id))
        end
    else
        root_path
    end
  end


  def is_admin?
    if user_signed_in?
      puts "logado"
      if current_user.admin? || current_user.superuser?
        return true
      end
    end
    puts "não logado"
    redirect_to root_path, alert: 'É preciso logar como administrador'
  end

  def is_superuser?
    if user_signed_in?
      if current_user.superuser?
        return true
      end
    end
    redirect_to root_path
  end

  def is_owner? (obj)
    #convert devise params
    my_param = params[:id]
    if params[:format].present?
      my_param = params[:format]
    end

    my_model = class_eval(obj)
    if user_signed_in?
      if my_model.find(my_param).user_id == current_user.id || is_superuser?
        return true
      end
    end
    redirect_to root_path, alert: 'Ops! Você só pode alterar o seu próprio perfil.'
  end

end
