module ApplicationHelper


    def flash_message
      messages = ""
      [:notice, :info, :warning, :error].each {|type|
        if flash[type]
          messages += "#{flash[type]}"
        end
      }

      messages
    end

    def resource_name
      :user
     end
    
     def resource
      @resource ||= User.new
     end
    
     def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
     end


end
