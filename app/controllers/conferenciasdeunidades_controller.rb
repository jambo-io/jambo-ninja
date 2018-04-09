class ConferenciasdeunidadesController < ApplicationController
  before_action :set_conferenciasdeunidade, only: [:show, :edit, :update, :destroy]

  # GET /conferenciasdeunidades
  # GET /conferenciasdeunidades.json
  def index
    @conferenciasdeunidades = Conferenciasdeunidade.all
  end

  # GET /conferenciasdeunidades/1
  # GET /conferenciasdeunidades/1.json
  def show
  end

  # GET /conferenciasdeunidades/new
  def new
    @conferenciasdeunidade = Conferenciasdeunidade.new
  end

  # GET /conferenciasdeunidades/1/edit
  def edit
  end

  # POST /conferenciasdeunidades
  # POST /conferenciasdeunidades.json
  def create
    @conferenciasdeunidade = Conferenciasdeunidade.new(conferenciasdeunidade_params)

    respond_to do |format|
      if @conferenciasdeunidade.save
        format.html { redirect_to @conferenciasdeunidade, notice: 'Conferenciasdeunidade was successfully created.' }
        format.json { render :show, status: :created, location: @conferenciasdeunidade }
      else
        format.html { render :new }
        format.json { render json: @conferenciasdeunidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conferenciasdeunidades/1
  # PATCH/PUT /conferenciasdeunidades/1.json
  def update
    respond_to do |format|
      if @conferenciasdeunidade.update(conferenciasdeunidade_params)
        format.html { redirect_to @conferenciasdeunidade, notice: 'Conferenciasdeunidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @conferenciasdeunidade }
      else
        format.html { render :edit }
        format.json { render json: @conferenciasdeunidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferenciasdeunidades/1
  # DELETE /conferenciasdeunidades/1.json
  def destroy
    @conferenciasdeunidade.destroy
    respond_to do |format|
      format.html { redirect_to conferenciasdeunidades_url, notice: 'Conferenciasdeunidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conferenciasdeunidade
      @conferenciasdeunidade = Conferenciasdeunidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conferenciasdeunidade_params
      params.require(:conferenciasdeunidade).permit(:name, :location, :start_at, :end_at, :description)
    end
end
