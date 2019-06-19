# Preview all emails at http://localhost:3000/rails/mailers/evento_mailer
class EventoMailerPreview < ActionMailer::Preview

    def confirmation_email
        @participant = Participant.last
        EventoMailer.confirmation_email(@participant)
	end

end
