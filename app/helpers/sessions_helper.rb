module SessionsHelper
	def signin
		session[:user_id] = @user.id
	end

	def user_name
		current_user.user_profile.name
	end
end
