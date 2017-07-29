class SignupMailer < ApplicationMailer
	def signup(user)
		@user = user
		mail(to:@user.email, subject:'Jambo')
	end
end
