class EventosbahaisController < ApplicationController
  before_action :set_eventosbahai, only: [:show, :edit, :update, :destroy]
  before_action :permission, only: [:new]
  before_action :correct_user_eventosbahais?, only: [:edit, :update, :destroy]

  # GET /eventosbahais
  # GET /eventosbahais.json
  def index
    @eventosbahais = Eventosbahai.order('id DESC').all
  end

  # GET /eventosbahais/1
  # GET /eventosbahais/1.json
  def show
  end

  # GET /eventosbahais/new
  def new

    @eventosbahai = Eventosbahai.new

    
  end

  # GET /eventosbahais/1/edit
  def edit
  end

  # POST /eventosbahais
  # POST /eventosbahais.json
  def create

    user = current_user
    @eventosbahai = user.eventosbahais.new(eventosbahai_params)

    if @eventosbahai.save
      redirect_to @eventosbahai
    end
  end

  def sendemail
    @eventosbahai = Eventosbahai.find(params[:id])
    @participant = Participant.last
    html = render_to_string "evento_mailer/confirmation_email", :layout=>false, formats: [:html]
    @htmlcontent = html.html_safe
  
  end
  def updateemail
  end

  # PATCH/PUT /eventosbahais/1
  # PATCH/PUT /eventosbahais/1.json
  def update
    respond_to do |format|
      if @eventosbahai.update(eventosbahai_params)
        format.html { redirect_to @eventosbahai, notice: 'Eventosbahai was successfully updated.' }
        format.json { render :show, status: :ok, location: @eventosbahai }
      else
        format.html { render :edit }
        format.json { render json: @eventosbahai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventosbahais/1
  # DELETE /eventosbahais/1.json
  def destroy
    @eventosbahai.destroy
    respond_to do |format|
      format.html { redirect_to eventosbahais_url, notice: 'Eventosbahai was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventosbahai
      @eventosbahai = Eventosbahai.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventosbahai_params
      params.require(:eventosbahai).permit(:name, :start_at, :end_at, :city, :state, :location, :theme, :description, :price, :vacancies, :sendemail, :image)
    end

    def permission
      unless admin?
        redirect_to root_path
      end
    end

  def correct_user_eventosbahais?
    eventobahai = Eventosbahai.find(params[:id])
    puts "aqui" + eventobahai.user_id.to_s
    puts current_user.id
    unless eventobahai.user_id == current_user.id
      redirect_to root_path
    end
  end
    


end
