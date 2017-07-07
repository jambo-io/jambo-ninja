class FormConferenceMailer < ApplicationMailer
	default from: "from@example.com"

	def conf_contact(user)
		@user = user
		mail(to:@user.email, subject:'Sample Email')
	end
end
