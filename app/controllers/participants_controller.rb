class ParticipantsController < ApplicationController
	before_action :permission, only: [:index, :destroy]

	layout "eventosbahais"

	def index
		@participants = Participant.all

		@user = User.find(current_user.id)
		@eventosbahais = @user.eventosbahais.order("id DESC")

		@size = @user.participants.size


	end
	def new




		@participant = Participant.new
		@evento_id = params[:id]
		@evento = Eventosbahai.find(@evento_id)
		@vacancies = @evento.vacancies.to_i - Participant.where(eventosbahai_id: @evento_id).count.to_i
		@registered = @evento.participants.where(:publist => 1)
		@images = @evento.image.url(:big)
		
		#Check if the Event is still available based on vacancies and Date
		@event_available = true
		 if @evento.start_at - Date.today  < 0 || @vacancies <= 0 
		 	@event_available = false
		 end

		 

	end
	def confirmation

		unless (params[:id].nil?)

			@participant = Participant.find(params[:id])
			if @participant.firstaccess == false
				@participant.update(firstaccess: true)
				@sendemail = @participant.eventosbahai.sendemail
				if @participant.contact =~ /\A[^@]+@[^@]+\Z/
					@emailveracity = true
				else
					@emailveracity = false
				end
			else
				redirect_to root_path
			end



		end

	end
	def show

	end
	def create

		@evento = Eventosbahai.find(participant_params[:eventosbahai_id])
		@participant = @evento.participants.new(participant_params)

      	if @participant.save
      		puts @evento.sendemail.inspect
      		

      		if @evento.sendemail == "1"
      			if @participant.contact =~ /\A[^@]+@[^@]+\Z/
								EventoMailer.confirmation_email(@participant).deliver_later
						else
							require 'twilio-ruby'

							account_sid = "ACa1d3f5008401dc2b6d1d62045f43efbe" # Your Account SID from www.twilio.com/console
							auth_token = "db4f98a2e7319836a485cd08fc31499f"   # Your Auth Token from www.twilio.com/console

							mail_text = EventoMailer.confirmation_email(@participant).text_part.body

							begin
								@client = Twilio::REST::Client.new account_sid, auth_token
								message = @client.messages.create(
										body: mail_text,
										to: '+55' + @participant.contact,    # Replace with your phone number
										from: "+13136494087")  # Replace with your Twilio number
							rescue Twilio::REST::TwilioError => e
								puts e.message
							end


						end
					end








					redirect_to :action => "confirmation", :id => @participant.id
      	else
        	redirect_to :action => "confirmation", :evid => participant_params[:eventosbahai_id], :error => true
      	end
    
	end
	def update
	end
	def destroy

		@participant = Participant.find(params[:id])
		@participant.destroy

		respond_to do |format|
			format.js { head :ok }
		end
		

			
	end

	

	private
		def participant_params
			params.require( :participant ).permit(:name, :lastname, :contact, :birthday, :address, :city, :state, :eventosbahai_id, :publist, :autolyse)
		end
		def permission
	      unless admin?
	        redirect_to root_path
	      end
    	end
    	

		
end
