class ParticipantsController < ApplicationController
	before_action :permission, only: [:index, :destroy, :edit]
	before_action :pin, only: [:show]

	layout "eventosbahais"

	def index
		@participants = Participant.order('name desc').all

		@user = User.find(current_user.id)
		unless @user.blank?
			@eventosbahais = @user.eventosbahais.order('id desc')
		end

		@size = 1
	end

	def edit
		@participant = Participant.find(params[:id])
		@eventosbahai_id = @participant.eventosbahai_id
		#Button Name
		@btname = "Salvar"
	end

	def new

		@participant = Participant.new
		@evento_id = params[:id]
		@eventosbahai_id = @evento_id
		@evento = Eventosbahai.find(@evento_id)
		@vacancies = @evento.vacancies.to_i - Participant.where(eventosbahai_id: @evento_id).count.to_i
		@registered = @evento.participants.where(:publist => 1)
		@images = @evento.image.url(:big)
		#Button name
		@btname = "Inscrever Agora"
		
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
				if @participant.email =~ /\A[^@]+@[^@]+\Z/
					@emailveracity = true
				else
					@emailveracity = false
				end
			else
				redirect_to root_path
			end



		end

	end

	def sms (participant)

		mail_text = EventoMailer.confirmation_email(participant).text_part.body
		endpoint = 'https://api.totalvoice.com.br/sms'
		require "uri"
		require "net/http"
		params = {'Access-Token': '4df9606fcb0aef3f6a89b61439eeccb3', numero_destino: "#{participant.contact}", mensagem: "#{mail_text}"}
		x = Net::HTTP.post_form(URI.parse("#{endpoint}"), params)
		puts x.body
		#puts JSON.parse(request_body)

	end

	def show

		@participant = Participant.find(params[:id])
		@event = @participant.eventosbahai
    	render layout: 'participant'

	end
	def create

		@evento = Eventosbahai.find(participant_params[:eventosbahai_id])
		@participant = @evento.participants.new(participant_params)
		
		user_id = current_user.id unless current_user.blank?

		@participant.user_id = user_id
		pin = rand(1000..9999)
		@participant.pin = pin

      	if @participant.save!

      		if @evento.sendemail == "1"
      			if @participant.email =~ /\A[^@]+@[^@]+\Z/
								EventoMailer.confirmation_email(@participant).deliver_later
						else
								sms(@participant) ##fire sms method

						end
					end


					redirect_to :action => "confirmation", :id => @participant.id
      	else
        	redirect_to :action => "confirmation", :evid => participant_params[:eventosbahai_id], :error => true
      	end
    
	end


	def update
		#@evento = Eventosbahai.find(participant_params[:eventosbahai_id])
		@participant = Participant.find(params[:id])
		@participant.update(participant_params)

		redirect_to participants_path

	end
	def destroy

		@participant = Participant.find(params[:id])
		@participant.destroy

		puts "passou qui"
		respond_to do |destroy|
			destroy.js
		end
		
	end

   def eventosbahais
      @eventosbahai = Eventosbahai.find(eventosbahais_params[:ids])
      respond_to do |format|
	     format.js
	  end
   end

	

   private
      def participant_params
         params.require( :participant ).permit(:eventosbahai_id, :publist, :autolyse)
      end
      def eventosbahais_params
         params.require(:eventosbahais).permit(:ids)
      end
      def permission
         unless user_signed_in? && current_user.admin?
            redirect_to root_path
         end
      end
      def pin
         @participant = Participant.find(params[:id])
         if session[:pin] == @participant.pin
            true
         else
            redirect_to pin_path
         end
      end
 end
