class ParticipantsController < ApplicationController


	def index
		@participants = Participant.all
	end
	def new
		@participant = Participant.new
		@evento_id = params[:id]
		
		@evento = Eventosbahai.find(@evento_id)
		
		
		
	end
	def show
	end
	def create

		@evento = Eventosbahai.find(participant_params[:eventosbahai_id])
		@participant = @evento.participants.new(participant_params)

		puts @participant.inspect

    	respond_to do |format|
      if @participant.save
        format.html { redirect_to root_path notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
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
