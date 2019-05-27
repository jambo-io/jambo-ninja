class AdministrativeFunctionsController < ApplicationController
  before_action :set_administrative_function, only: [:show, :edit, :update, :destroy]

  # GET /administrative_functions
  # GET /administrative_functions.json
  def index
    @administrative_functions = AdministrativeFunction.all
  end

  # GET /administrative_functions/1
  # GET /administrative_functions/1.json
  def show
  end

  # GET /administrative_functions/new
  def new
    @administrative_function = AdministrativeFunction.new
  end

  # GET /administrative_functions/1/edit
  def edit
  end

  # POST /administrative_functions
  # POST /administrative_functions.json
  def create
    @administrative_function = AdministrativeFunction.new(administrative_function_params)

    respond_to do |format|
      if @administrative_function.save
        format.html { redirect_to @administrative_function, notice: 'Função administrativa criada com sucesso.' }
        format.json { render :show, status: :created, location: @administrative_function }
      else
        format.html { render :new }
        format.json { render json: @administrative_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrative_functions/1
  # PATCH/PUT /administrative_functions/1.json
  def update
    respond_to do |format|
      if @administrative_function.update(administrative_function_params)
        format.html { redirect_to @administrative_function, notice: 'Função administrativa atualizada.' }
        format.json { render :show, status: :ok, location: @administrative_function }
      else
        format.html { render :edit }
        format.json { render json: @administrative_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrative_functions/1
  # DELETE /administrative_functions/1.json
  def destroy
    @administrative_function.destroy
    respond_to do |format|
      format.html { redirect_to administrative_functions_url, notice: 'Função administrativa deletada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrative_function
      @administrative_function = AdministrativeFunction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrative_function_params
      params.require(:administrative_function).permit(:name)
    end
end
