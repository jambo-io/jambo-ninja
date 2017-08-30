class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #Prevent CSRF attacks by raising exception.
  #For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
  	unless logged_in?
  		redirect_to root_url
  	end
  end
  def correct_user?
  	@user = User.find(params[:id])
  	unless current_user == @user
  		redirect_to users_path
  	end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end



end
