class SessionsController < ApplicationController
	
  layout "eventosbahais"
  
  def create
  	@user = User.find_by(email:params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		signin
  	    redirect_to participants_path
  	else
  		render 'new'
  	end
  end
  def destroy
  	signout
  	redirect_to root_url
  end
end
