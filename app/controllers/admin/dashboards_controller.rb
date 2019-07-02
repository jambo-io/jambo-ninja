class Admin::DashboardsController < Admin::AdminController
    before_action :authenticate_user!

    def index
		@participants = Participant.order('id desc').all
		@user = User.find(current_user.id)
		unless @user.blank?
			@eventosbahais = @user.eventosbahais.order('id desc')
		end

		@size = 1
    end
    
    def new_mailer_manager
        @event = Eventosbahai.find(params[:id])
        participants = @event.participants

        @participant = current_user.participants.where(eventosbahai_id: params[:id]).first
        @itinerary = @participant.itinerary

        participant_emails = []
        participants.each do |participant|
            participant_emails.push(participant.email)
        end

        @participant_emails = participant_emails.join(", ")

        puts @event.inspect
        @admin_mailer_manager = Admin::MailerManager.new
    end

    def mass_mailer(participants, to_whom, subject, body)
        mailer = current_user.mailer_managers.new
        puts "INpsect 4"
        puts mailer.inspect

        mailer.subject = subject
        mailer.body = body
        mailer.eventosbahai_id = participants.last.eventosbahai_id
 
        if mailer.save!
            participants.each do |participant|
                if(to_whom == "no_itinerary")
                    if participant.itinerary.transportation.blank?
                        # Config Body
                        body = mailer_manager_params[:body]
                        body.gsub! "|% participante %|", participant.name
                        body.gsub! "|% link_itinerario %|", "#{ view_context.link_to edit_participant_itinerary_url(participant, participant.itinerary), request.base_url + edit_participant_itinerary_path(participant, participant.itinerary)}"
                        mailer.body = body

                        send = Admin::DashboardMailer.custom_mail(mailer,participant.email).deliver_now
                    end
                else
                    send = Admin::DashboardMailer.custom_mail(mailer,participant.email).deliver_now
                end
            end 
            redirect_to admin_path, notice: 'E-mail enviado!'
        end
    end

    def create_mailer_manager
        # puts "Inspect 1"
        # puts mailer_manager_params
        # event = Eventosbahai.find(mailer_manager_params[:eventosbahai_id])
        # to_whom = params[:to_whom]
        # participants = event.participants
        # subject = mailer_manager_params[:subject]
        # body = mailer_manager_params[:body]
        # mass_mailer(participants, to_whom, subject, body)
    end

    def test_mailer_production
        puts 'Test Mailer production'
        participants = Participant.where(user_id: current_user.id)
        to_whom = participants
        subject = "mass mailing test"
        participant = participants.first
        body =  "#{ view_context.link_to edit_participant_itinerary_url(participant, participant.itinerary), request.base_url + edit_participant_itinerary_path(participant, participant.itinerary)}"
        mass_mailer(participants, to_whom, subject, body)
    end

    private
    def mailer_manager_params
        params.require(:admin_mailer_manager).permit(:to_whom, :subject, :body, :eventosbahai_id)
    end

end
