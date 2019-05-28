class JambodocCategoriesController < ApplicationController
  before_action :set_jambodoc_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /jambodoc_categories
  # GET /jambodoc_categories.json
  def index
    @jambodoc_categories = JambodocCategory.all
  end

  # GET /jambodoc_categories/1
  # GET /jambodoc_categories/1.json
  def show
  end

  # GET /jambodoc_categories/new
  def new
    @jambodoc_category = JambodocCategory.new
  end

  # GET /jambodoc_categories/1/edit
  def edit
  end

  # POST /jambodoc_categories
  # POST /jambodoc_categories.json
  def create
    @jambodoc_category = JambodocCategory.new(jambodoc_category_params)

    respond_to do |format|
      if @jambodoc_category.save
        format.html { redirect_to @jambodoc_category, notice: 'Jambodoc category was successfully created.' }
        format.json { render :show, status: :created, location: @jambodoc_category }
      else
        format.html { render :new }
        format.json { render json: @jambodoc_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jambodoc_categories/1
  # PATCH/PUT /jambodoc_categories/1.json
  def update
    respond_to do |format|
      if @jambodoc_category.update(jambodoc_category_params)
        format.html { redirect_to @jambodoc_category, notice: 'Jambodoc category was successfully updated.' }
        format.json { render :show, status: :ok, location: @jambodoc_category }
      else
        format.html { render :edit }
        format.json { render json: @jambodoc_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jambodoc_categories/1
  # DELETE /jambodoc_categories/1.json
  def destroy
    @jambodoc_category.destroy
    respond_to do |format|
      format.html { redirect_to jambodoc_categories_url, notice: 'Jambodoc category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jambodoc_category
      @jambodoc_category = JambodocCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jambodoc_category_params
      params.require(:jambodoc_category).permit(:title, :desc)
    end
end
