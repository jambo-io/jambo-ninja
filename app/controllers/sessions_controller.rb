class SessionsController < ApplicationController
  def create
  	@user = User.find_by(email:params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		signin
  	    redirect_to bemvindos_url
  	else
  		render 'new'
  	end
  end
  def destroy
  	signout
  	redirect_to root_url
  end
end
