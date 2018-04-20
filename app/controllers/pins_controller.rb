class PinsController < ApplicationController
  layout "eventosbahais"
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
   puts @participant.inspect
    if @participant

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


    participant = Participant.find(pay_params)

    if participant.paid == false
      participant.update(paid: true)
      participant.save

    elsif participant.paid == true
      participant.update(paid: false)
      participant.save
    end


    redirect_to participants_path
  end

  private
  def pin_params
    params.require(:pin).permit(:contact,:pin)
  end
  def pay_params
    params.require(:participant_id)
  end

end
