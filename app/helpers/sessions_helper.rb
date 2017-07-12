module SessionsHelper
	def signin
		session[:user_id] = @user.id
	end
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
	def block_access
		if current_user.present?
			redirect_to users_path
		end
	end
	def logged_in?
		!current_user.nil?
	end
	def signout
		session.delete(:user_id)
		@current_user = nil
	end
	def user_name
		self.current_user.name
	end
	def privilege
		@privilege = self.current_user.privilege
	end
end
