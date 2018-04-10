class ParticipantsController < ApplicationController
	def index
		@participants = Participant.all
	end
	def new
		@participant = Participant.new
		@participant.eventosbahais.build 
	end
	def show
	end
	def create
	end
	def update
	end
	def destroy
	end
end
