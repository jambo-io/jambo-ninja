class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  #before_action :is_superuser?, only: [:index]
  before_action only: [:edit] do 
    is_owner? ('User')
  end

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
    @user_name = @user.user_profile.name
    @user_email = @user.email

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
      params.require(:user).permit(:name,:email,:password,:password_confirmation, :privileges,
      user_profile_attributes: [:name, :lastname, :birthday, :phone, :address, :city, :state, :number, :zipcode])  
    end
  
end
