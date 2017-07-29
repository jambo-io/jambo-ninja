# Preview all emails at http://localhost:3000/rails/mailers/signup_mailer
class SignupMailerPreview < ActionMailer::Preview
	def signup_preview
		SignupMailer.signup(User.first)
	end
end
