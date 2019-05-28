class QualquernomesController < ApplicationController
  before_action :set_qualquernome, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /qualquernomes
  # GET /qualquernomes.json
  def index
    @qualquernomes = Qualquernome.all
  end

  # GET /qualquernomes/1
  # GET /qualquernomes/1.json
  def show
  end

  # GET /qualquernomes/new
  def new
    @qualquernome = Qualquernome.new
  end

  # GET /qualquernomes/1/edit
  def edit
  end

  # POST /qualquernomes
  # POST /qualquernomes.json
  def create
    @qualquernome = Qualquernome.new(qualquernome_params)

    respond_to do |format|
      if @qualquernome.save
        format.html { redirect_to @qualquernome, notice: 'Qualquernome was successfully created.' }
        format.json { render :show, status: :created, location: @qualquernome }
      else
        format.html { render :new }
        format.json { render json: @qualquernome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qualquernomes/1
  # PATCH/PUT /qualquernomes/1.json
  def update
    respond_to do |format|
      if @qualquernome.update(qualquernome_params)
        format.html { redirect_to @qualquernome, notice: 'Qualquernome was successfully updated.' }
        format.json { render :show, status: :ok, location: @qualquernome }
      else
        format.html { render :edit }
        format.json { render json: @qualquernome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualquernomes/1
  # DELETE /qualquernomes/1.json
  def destroy
    @qualquernome.destroy
    respond_to do |format|
      format.html { redirect_to qualquernomes_url, notice: 'Qualquernome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualquernome
      @qualquernome = Qualquernome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qualquernome_params
      params.fetch(:qualquernome, {})
    end
end
