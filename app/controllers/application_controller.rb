class ApplicationController < ActionController::Base
       
  protect_from_forgery with: :exception
  #Prevent CSRF attacks by raising exception.
  #For APIs, you may want to use :null_session instead.
  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :is_admin?
  before_action :is_superuser?

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

  private
  def is_admin?
    if user_signed_in?
      if current_user.admin? || current_user.superuser?
        return true
      end
    end
    return false
  end

  def is_superuser?
    if user_signed_in?
      if current_user.superuser?
        return true
      end
    end
    return false
  end
  helper_method :is_admin?
  helper_method :is_superuser?
end
