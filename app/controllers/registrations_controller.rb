class RegistrationsController < Devise::RegistrationsController
    before_action except: [:new, :create, :update, :destroy] do 
        is_owner? ('User')
    end
    
    protected
  
    def after_sign_up_path_for(resource)
        if(params[:eventosbahai_id].present?)
            confirm_registration_path(Eventosbahai.find(params[:eventosbahai_id]))
        else
            root_path
        end
    end

end