# Preview all emails at http://localhost:3000/rails/mailers/form_conference_mailer
class FormConferenceMailerPreview < ActionMailer::Preview
	def form_conference_preview
		FormConferenceMailer.conf_contact(Bemvindo.first)
	end
end
