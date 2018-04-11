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

	def admin?
		if logged_in?
			@privileges ||= self.current_user['privileges']
			return true if self.current_user['privileges']=='admin'
		end
	end

	def privileges
		@privileges ||= self.current_user['privileges']

		if(self.current_user['privileges']=='campogrande-ms')

			@privileges = ['campogrande-ms','corumba-ms','saogabrieldooeste-ms']

		elsif(self.current_user['privileges']=='dourados-ms')

			@privileges = ['dourados-ms','jardim-ms','riobrilhante-ms']

		elsif(self.current_user['privileges']=='tangara-mt')

			@privileges = ['tangara-mt','caceres-mt']

		elsif(self.current_user['privileges']=='all')
			@privileges = ['campogrande-ms','corumba-ms','saogabrieldooeste-ms','dourados-ms','jardim-ms','riobrilhante-ms','tangara-mt','caceres-mt'];

		end
	end
end
