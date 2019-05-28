class EventoMailer < ApplicationMailer

	def confirmation_email(participant)
		puts "Enviar Email.. a qualquer momento..."
		@participant = participant
		@eventosbahai = Eventosbahai.find(@participant.eventosbahai_id)
		@itinerary = @participant.itinerary
		puts @participant.inspect
		attachments.inline['emailforyou.png'] = File.read("#{Rails.root}/app/assets/images/emailforyou.png")
		email = @participant.user.email unless @participant.user.blank?
		name = @participant.name
		mail(to: email, subject: "Obrigado por se inscrever #{name}!")

	end
end
