class ParticipantsController < ApplicationController
	layout "eventosbahais"

	def index
		@participants = Participant.all
	end
	def new
		@participant = Participant.new
		@evento_id = params[:id]
		
		@evento = Eventosbahai.find(@evento_id)

		@vacancies = @evento.vacancies.to_i - Participant.where(eventosbahai_id: @evento_id).count.to_i
		
		
		
	end
	def confirmation
		@participant = Participant.find(params[:id])
	end
	def show
	end
	def create

		@evento = Eventosbahai.find(participant_params[:eventosbahai_id])
		@participant = @evento.participants.new(participant_params)

      if @participant.save
      	EventoMailer.confirmation_email(@participant).deliver
        redirect_to :action => "confirmation", :id => @participant.id
      else
        render :new 
      end
    
	end
	def update
	end
	def destroy
	end

	

	private
		def participant_params
			params.require( :participant ).permit(:name, :lastname, :contact, :birthday, :address, :city, :state, :eventosbahai_id)
		end

		
end
