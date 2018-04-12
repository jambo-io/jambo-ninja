class EventoMailer < ApplicationMailer
	default from: 'jamboninja@example.com'

	def confirmation_email(participant)
		
		@participant = participant
		@eventosbahai = Eventosbahai.find(@participant.eventosbahai_id)
		puts @participant.inspect
		mail(to: @participant.contact, subject: 'Obrigado por se inscrever!')
	end
end
