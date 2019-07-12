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

  # Get Individual Record and Check if it belongs to User, also allow Admin and Superusers to View
  def allow_content_by_user_role (record)
    if user_signed_in?
      if (current_user.admin? || current_user.superuser?) && (record.user_id == current_user.id || current_user.superuser?)
        return true
      end
    end
    return false 
  end

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

end
