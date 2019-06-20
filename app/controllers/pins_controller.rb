class PinsController < ApplicationController
  before_action :authenticate_user!
  def new
    if session[:pin]
      @participant = Participant.find_by(:pin => session[:pin])
      if(@participant)
        redirect_to participant_path(@participant)
      else
        session.delete(:pin)
      end
    end
  end
  def create
   # Verifica se o E-mail e o PIN fornecido estão de acordo
   @participant = Participant.where(:contact => pin_params[:contact], :pin => pin_params[:pin]).first
    if @participant
      @participant.update(:phoneconfirmed => true)
      session[:pin] = @participant.pin
      redirect_to participant_path(@participant)
    else
      render :new
      flash[:notice] = "E-mail e/ou Código não encontrados."
    end
  end

  def destroy

     session.delete(:pin)
    redirect_to root_path

  end

  def pay

    puts "ola mundo"
    participant = Participant.find(pay_params)
    @participant_id = participant.id

    if participant.paid == false
      participant.update(paid: true)
      participant.save
      @paid = true

    elsif participant.paid == true
      participant.update(paid: false)
      participant.save
      @paid = false
    end

    respond_to do |format|
      format.js 
    end
    
  end

  private
  def pin_params
    params.require(:pin).permit(:contact,:pin)
  end
  def pay_params
    params.require(:participant_id)
  end

end
