class SessionsController < ApplicationController
  def create
  	@user = User.find_by(email:params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		signin
  	    redirect_to @user
  	else
  		render 'new'
  	end
  end
  def destroy
  	signout
  	redirect_to root_url
  end
end
