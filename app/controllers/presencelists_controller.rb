class PresencelistsController < ApplicationController
  include SessionsHelper
  layout 'participant'
  before_action :redirect, only: [:index]
  def index
    @participants = Participant.order(:id).all
    @user = User.find(current_user.id)
    @eventosbahais = @user.eventosbahais
  end
  private
  def redirect
    unless admin?
      redirect_to root_path
    end
  end
end
