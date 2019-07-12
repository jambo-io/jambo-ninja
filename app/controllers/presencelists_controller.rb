class PresencelistsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  include SessionsHelper
  
  def index
    @eventosbahai = Eventosbahai.find(params[:id])
    @participants = @eventosbahai.participants
    @user = User.find(current_user.id)
    @eventosbahais = @user.eventosbahais
  end

end
