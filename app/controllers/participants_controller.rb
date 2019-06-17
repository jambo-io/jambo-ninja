class ParticipantsController < ApplicationController
	before_action :authenticate_user!, except: [:new, :check_email]
	before_action :subscribed_redirect, only: [:new]

	def index
		@participants = Participant.order('id desc').all

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
		@event_id = params[:id]
		@eventosbahai_id = @event_id
		@event = Eventosbahai.find(@event_id)
		@vacancies = @event.vacancies.to_i - Participant.where(eventosbahai_id: @event_id).count.to_i
		#Button name
		@btname = "Inscrever-se"
		
		#Check if the Event is still available based on vacancies and Date
		@event_available = true
		 if @event.start_at - Date.today  < 0 || (!@event.vacancies.nil? && @vacancies <= 0 )
		 	@event_available = false
		 end
	end
	def confirmation
		unless (params[:id].nil?)

			@participant = Participant.where(user_id: params[:id]).last
			@itinerary = @participant.itinerary
			@event = @participant.eventosbahai
			
			if @participant.firstaccess == true
				@participant.update(firstaccess: true)
				@sendemail = @participant.eventosbahai.sendemail
				if current_user.email =~ /\A[^@]+@[^@]+\Z/
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
		@itinerary = @participant.itinerary
		@event = @participant.eventosbahai
	end

	def create
		@evento = Eventosbahai.find(participant_params[:eventosbahai_id])
		@participant = @evento.participants.new(participant_params)
		fullname = params[:fullname]
		current_user.user_profile.update(fullname: fullname)
		user_id = current_user.id unless current_user.blank?
		puts "USER ID"
		puts user_id
		@participant.user_id = user_id
		pin = rand(1000..9999)
		@participant.pin = pin

      	if @participant.save!
				puts "1.0 - Salvo"
				if @evento.sendemail == "1"
					puts "2.0 - SendEmail"
					if @participant.email =~ /\A[^@]+@[^@]+\Z/
								puts "2.0 - Email"
								EventoMailer.confirmation_email(@participant).deliver_later
						else
								puts "2.2 - SMS"
								sms(@participant) ##fire sms method

						end
					end

					puts "3.0 - Redirect"
					redirect_to :action => "confirmation", :id => user_id
			else
				puts "3.3 - Redirect"
        		redirect_to :action => "confirmation", :evid => participant_params[:eventosbahai_id], :error => true
     	 	end
	end


	def update
		#@evento = Eventosbahai.find(participant_params[:eventosbahai_id])
		@participant = Participant.find(params[:id])
		@participant.update(participant_params)

		redirect_to root_path

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

	def confirm_registration
		@event = Eventosbahai.find(params[:id])
		@participant = Participant.new
	end

	def check_email
		require 'uri'
		puts "Requested Reached Here"
		email = params[:email]
		puts "Email analyses"
		puts email.inspect
		if email.match(URI::MailTo::EMAIL_REGEXP).present?
			user = User.where(email:email)
			if(user.present?)
				puts "User existent"
				render json: { 
					status: "200",
					message: "Success"	
				}.to_json
			else
				puts "User non existent"
				render json: { 
					status: "403",
					message: "Failed"	
				}.to_json
			end
		end
		
	end
	

   private
      def participant_params
         params.require( :participant ).permit(:eventosbahai_id, :autolyse, :administrative_function_id, :itinerary_attributes => [:transportation, :company, :departure, :arrival, :flight_number])
      end
      def eventosbahais_params
         params.require(:eventosbahais).permit(:ids)
      end
      def pin
         @participant = Participant.find(params[:id])
         if session[:pin] == @participant.pin
            true
         else
            redirect_to pin_path
         end
	  end
	  def subscribed_redirect
		if user_signed_in?
			participant = current_user.participants.where(eventosbahai_id: params[:id]).first
			if participant.present?
				redirect_to participant_path(participant)
			end
		end
	  end
 end
