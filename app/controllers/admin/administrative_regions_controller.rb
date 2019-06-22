class AdministrativeRegionsController < Admin::AdminController
  before_action :set_administrative_region, only: [:show, :edit, :update, :destroy]

  # GET /administrative_regions
  # GET /administrative_regions.json
  def index
    @administrative_regions = AdministrativeRegion.all
  end

  # GET /administrative_regions/1
  # GET /administrative_regions/1.json
  def show
  end

  # GET /administrative_regions/new
  def new
    @administrative_region = AdministrativeRegion.new
  end

  # GET /administrative_regions/1/edit
  def edit
  end

  # POST /administrative_regions
  # POST /administrative_regions.json
  def create
    @administrative_region = AdministrativeRegion.new(administrative_region_params)

    respond_to do |format|
      if @administrative_region.save
        format.html { redirect_to @administrative_region, notice: 'Administrative region was successfully created.' }
        format.json { render :show, status: :created, location: @administrative_region }
      else
        format.html { render :new }
        format.json { render json: @administrative_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrative_regions/1
  # PATCH/PUT /administrative_regions/1.json
  def update
    respond_to do |format|
      if @administrative_region.update(administrative_region_params)
        format.html { redirect_to @administrative_region, notice: 'Administrative region was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrative_region }
      else
        format.html { render :edit }
        format.json { render json: @administrative_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrative_regions/1
  # DELETE /administrative_regions/1.json
  def destroy
    @administrative_region.destroy
    respond_to do |format|
      format.html { redirect_to administrative_regions_url, notice: 'Administrative region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrative_region
      @administrative_region = AdministrativeRegion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrative_region_params
      params.require(:administrative_region).permit(:name)
    end
end
