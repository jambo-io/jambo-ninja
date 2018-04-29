class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update, :destroy]
  before_action :permission, only: [:index]
  layout "eventosbahais"

  def index
    @users = User.all
    
  end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)



    respond_to do |format|
      if @user.save
        #Envia email ao usuário ao confirmar formulário
        SignupMailer.signup(@user).deliver_later
        format.html { redirect_to @user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render action: :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  	
  end
  def show
    @user = User.find(params[:id])
    @user_name = @user.name
    @user_email = @user.email

    #Ruhibook profile FORM
    @ruhi = @user.ruhibook
    if @ruhi.nil?
      @ruhibook = Ruhibook.new
    else
      @ruhibook = Ruhibook.find_by(:user_id => params[:id])
    end

    #Cluster profile FORM
    @clus = @user.cluster
    if @clus.nil?
      puts "cluster é vazio"
      @cluster = Cluster.new
    else
      @cluster = Cluster.find_by(:user_id => current_user.id)
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render action: :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    signout
    redirect_to root_path
  end

  private
  	def user_params
  		params.require(:user).permit(:name,:email,:password,:password_confirmation, :privileges)  
    end
    def permission
      unless admin?
        redirect_to root_path
      end
    end
  
end
