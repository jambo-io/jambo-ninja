class EventosbahaisController < ApplicationController
   before_action :set_eventosbahai, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, :only => [:new]
   before_action :is_admin?, :except => [:index]
   before_action :except => [:index, :new, :create] do
      is_owner? ('Eventosbahai')
   end
   
   def index
      @eventosbahais = Eventosbahai.order('id DESC').all
   end

   def show
   end

   def new
      @eventosbahai = Eventosbahai.new
   end

   def edit
      puts "editando"
   end

   def create
      user = current_user
      @eventosbahai = user.eventosbahais.new(eventosbahai_params)
      if @eventosbahai.save!
         redirect_to @eventosbahai
      end
   end

   def sendemail
      @eventosbahai = Eventosbahai.find(params[:id])
      @participant = Participant.last
      html = render_to_string "evento_mailer/confirmation_email", :layout=>false, formats: [:html]
      @htmlcontent = html.html_safe
   end

   def update
      respond_to do |format|
         if @eventosbahai.update(eventosbahai_params)
            format.html { redirect_to @eventosbahai }
            format.json { render :show, status: :ok, location: @eventosbahai }
         else
            format.html { render :edit }
            format.json { render json: @eventosbahai.errors, status: :unprocessable_entity }
         end
      end
   end

   def destroy
      @eventosbahai.destroy
      redirect_to root_path
   end

   private
   def set_eventosbahai
      @eventosbahai = Eventosbahai.find(params[:id])
   end

   def eventosbahai_params
      params.require(:eventosbahai).permit(:name, :start_at, :end_at, :city, :state, :location, :theme, :description, :price, :vacancies, :sendemail, :image, :payment, :itinerary, :share, :administrative_function)
   end
   
end
