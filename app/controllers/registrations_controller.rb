class RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_sign_up_path_for(resource)
        if(params[:eventosbahai_id].present?)
            confirm_registration_path(Eventosbahai.find(params[:eventosbahai_id]))
        else
            root_path
        end
    end
  end