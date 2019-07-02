class ItinerariesController < ApplicationController
    before_action :set_itinerary, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :is_owner

    def index

    end

    def edit
    end

    def update
        respond_to do |format|
            if @itinerary.update(itinerary_params)
              format.html { redirect_to participant_url(@participant), notice: 'Itinerário atualizado.' }
              format.json { render :show, status: :ok, location: @itinerary }
            else
              format.html { render :edit }
              format.json { render json: @itinerary.errors, status: :unprocessable_entity }
            end
          end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @participant = Participant.find(params[:participant_id])
      @itinerary = @participant.itinerary
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_params
      params.require(:itinerary).permit(:transportation, :company, :flight_number, :departure, :arrival, :airport_arrival, :airport_departure)
    end

    def is_owner
      @participant = Participant.find(params[:participant_id])
      @itinerary = Itinerary.find(params[:id])

      if((current_user.id !=  @participant.user_id) && !current_user.superuser?)
        redirect_to root_path
      end
    end
    
end
