class BadgesController < ApplicationController
  include SessionsHelper
  layout 'participant'
  before_action :redirect, only: [:index]

  def index
    @eventosbahai = Eventosbahai.find(params[:id])
    @participants = @eventosbahai.participants
    @user = User.find(current_user.id)
    @eventosbahais = @user.eventosbahais
  end

  private
  def redirect
    unless (user_signed_in? && current_user.admin?) || current_user.superuser?
      redirect_to root_path
    end
  end

end