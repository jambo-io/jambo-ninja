class Api::V1::EventosbahaisController < Api::V1::ApiController
    before_action :set_eventosbahai, except: [:index, :create, :update]
    before_action :authenticate_user!
    
    def index
        @eventosbahais = Eventosbahai.order('id DESC').all
        render json: @eventosbahais, each_serializer: EventosbahaiIndexSerializer
    end

    def show
        render json: @eventosbahai, each_serializer: EventosbahaiShowSerializer
    end

    def create
        user = current_user
        puts "Inspect 1"
        puts user.inspect
        @eventosbahai = user.eventosbahais.new(eventosbahai_params)
        if @eventosbahai.save!
           render @eventosbahai
        end
     end

    private
        def set_eventosbahai
            @eventosbahai = Eventosbahai.find(params[:id])
        end

        def eventosbahai_params
            params.require(:eventosbahai).permit(:name, :start_at, :end_at, :city, :state, :location, :theme, :description, :price, :vacancies, :sendemail, :image, :payment, :itinerary, :share, :administrative_function)
        end

end