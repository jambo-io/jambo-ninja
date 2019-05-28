class ParticipantRolesController < ApplicationController
  before_action :set_participant_role, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /participant_roles
  # GET /participant_roles.json
  def index
    @participant_roles = ParticipantRole.all
  end

  # GET /participant_roles/1
  # GET /participant_roles/1.json
  def show
  end

  # GET /participant_roles/new
  def new
    @participant_role = ParticipantRole.new
  end

  # GET /participant_roles/1/edit
  def edit
  end

  # POST /participant_roles
  # POST /participant_roles.json
  def create
    @participant_role = ParticipantRole.new(participant_role_params)

    respond_to do |format|
      if @participant_role.save
        format.html { redirect_to @participant_role, notice: 'Participant role was successfully created.' }
        format.json { render :show, status: :created, location: @participant_role }
      else
        format.html { render :new }
        format.json { render json: @participant_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participant_roles/1
  # PATCH/PUT /participant_roles/1.json
  def update
    respond_to do |format|
      if @participant_role.update(participant_role_params)
        format.html { redirect_to @participant_role, notice: 'Participant role was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant_role }
      else
        format.html { render :edit }
        format.json { render json: @participant_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participant_roles/1
  # DELETE /participant_roles/1.json
  def destroy
    @participant_role.destroy
    respond_to do |format|
      format.html { redirect_to participant_roles_url, notice: 'Participant role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant_role
      @participant_role = ParticipantRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_role_params
      params.require(:participant_role).permit(:name)
    end
end
