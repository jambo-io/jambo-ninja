class FormConferenceMailer < ApplicationMailer
	def conf_contact(user)
		@user = user
		mail(to:@user.email, subject:'Conferências Locais de Juventude')
	end

	def dourados_contact(user)
		@user = user
		mail(to:@user.email, subject:'Conferências Locais de Juventude')
	end

	def tangara_contact(user)
		@user = user
		mail(to:@user.email, subject:'Conferências Locais de Juventude')
	end

end
