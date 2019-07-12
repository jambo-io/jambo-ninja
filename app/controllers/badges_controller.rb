class BadgesController < ApplicationController
  include SessionsHelper
  layout 'participant'
  before_action :is_admin?

  def index
    @eventosbahai = Eventosbahai.find(params[:id])
    @participants = @eventosbahai.participants
    @user = User.find(current_user.id)
    @eventosbahais = @user.eventosbahais
  end

end