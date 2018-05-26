module ParticipantsHelper
   def correct_user_eventosbahais?
      eventobahai = Eventosbahai.find(params[:id])
      if eventobahai.user_id == current_user.id
         true
      else
         false
      end
   end
   def paid(paid)
      if paid==true
      	return "btn-success"
      end
   end

   def phone_confirmed(contact)
      return link_to contact, "https://api.whatsapp.com/send?phone=55"+@contact.to_s, { target:"_blank", id:"popover", class:"text-success", 'data-trigger':'body', 'data-toggle':'popover', 'data-placement':'top', 'data-content':'Email/Celular confirmado.' }
   end

   def contact(contact,phoneconfirmed)
      if contact =~ /\A[^@]+@[^@]+\Z/
      	if phoneconfirmed == true
            return phone_confirmed(contact)
      	else
      		return contact
      	end
      else 
         if phoneconfirmed == true 
            return phone_confirmed(contact)
         else 
            contact_helper = contact.delete("^0-9").gsub(/\s+/, '') 
          	return link_to contact_helper, "https://api.whatsapp.com/send?phone=55"+@contact.to_s, target:"_blank"
         end 
      end
   end
   def birthday(birthday)
      unless birthday.nil?
         age =  Date.today.year - birthday.year 
         if age > 30 
            return "Maior de 30"
         else
            return age
         end 
       end 
  	end
  	def autolyse (string)
  		if (string=="1")
  			return "Parcelado"
  		elsif string=="2"
  			return "À Vista"
  		elsif string=="3"
  			return "Menor de 12"
  		end
  	end

end
