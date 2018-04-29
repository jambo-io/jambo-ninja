class RuhibooksController < ApplicationController
  def index

  end
  def new
    @ruhibook = Ruhibook.new
  end
  def edit

  end
  def create

    puts "chegou no create"

    puts ruhibook_params[:name].inspect

    @current_user = current_user.id
    ruhibook = Ruhibook.new(name:ruhibook_params[:name], user_id:@current_user)

    ruhibook.save
    redirect_to user_path(@current_user)


  end
  def show

  end
  def update
    @user = User.find(current_user.id)
    if ruhibook_params[:name].nil?
      @user.ruhibook.destroy
    else
      @user.ruhibook.update_attributes(ruhibook_params)
    end
    redirect_to user_path(current_user.id)

  end
  def destroy

  end

  private
  def ruhibook_params
    params.fetch(:ruhibook, {}).permit(:name=> [])
  end
end
