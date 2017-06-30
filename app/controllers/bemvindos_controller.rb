class BemvindosController < ApplicationController
  before_action :set_bemvindo, only: [:show, :edit, :update, :destroy]

  # GET /bemvindos
  # GET /bemvindos.json
  def index
    @bemvindos = Bemvindo.all
  end

  # GET /bemvindos/1
  # GET /bemvindos/1.json
  def show
  end

  # GET /bemvindos/new
  def new
    @bemvindo = Bemvindo.new
  end

  # GET /bemvindos/1/edit
  def edit
  end

  # POST /bemvindos
  # POST /bemvindos.json
  def create
    @bemvindo = Bemvindo.new(bemvindo_params)

    respond_to do |format|
      if @bemvindo.save
        format.html { redirect_to @bemvindo, notice: 'Bemvindo was successfully created.' }
        format.json { render :show, status: :created, location: @bemvindo }
      else
        format.html { render :new }
        format.json { render json: @bemvindo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bemvindos/1
  # PATCH/PUT /bemvindos/1.json
  def update
    respond_to do |format|
      if @bemvindo.update(bemvindo_params)
        format.html { redirect_to @bemvindo, notice: 'Bemvindo was successfully updated.' }
        format.json { render :show, status: :ok, location: @bemvindo }
      else
        format.html { render :edit }
        format.json { render json: @bemvindo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bemvindos/1
  # DELETE /bemvindos/1.json
  def destroy
    @bemvindo.destroy
    respond_to do |format|
      format.html { redirect_to bemvindos_url, notice: 'Bemvindo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bemvindo
      @bemvindo = Bemvindo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bemvindo_params
      params.require(:bemvindo).permit(:Name, :lastname, :email, :comentarios)
    end
end
