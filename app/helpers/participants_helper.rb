module ParticipantsHelper
	def correct_user_eventosbahais?
      eventobahai = Eventosbahai.find(params[:id])
      if eventobahai.user_id == current_user.id
        true
      else
      	false
      end
  	end
end
