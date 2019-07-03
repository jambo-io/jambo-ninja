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
        @participants = @event.participants
        @participants_no_itinerary = 
            Participant.joins("LEFT JOIN itineraries ON participants.id = itineraries.id")
            .where("itineraries.transportation IS NULL AND eventosbahai_id = #{@event.id}")
            .select("participants.*, itineraries.*")

        participant_emails = []
        @participants.each do |participant|
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
                # Config Body
                puts "Inspect 5"
                puts participant.inspect
                body = body_process mailer_manager_params[:body], participant
                mailer.body = body
                send = Admin::DashboardMailer.custom_mail(mailer,participant.email).deliver_now
            end 
            redirect_to admin_path, notice: 'E-mail enviado!'
        end
    end

    def create_mailer_manager
        participant_ids = params[:event][:participant_ids]
        participant_ids = participant_ids.reject(&:blank?)
        event = Eventosbahai.find(mailer_manager_params[:eventosbahai_id])
        to_whom = params[:to_whom]
        participants = Participant.find(participant_ids)
        if participants.blank?
            redirect_to admin_path, error: 'Nenhum E-mail foi enviado. Verifique se os destinatários foram selecionados.'
            return false
        end
        subject = mailer_manager_params[:subject]
        body = mailer_manager_params[:body]
        mass_mailer(participants, to_whom, subject, body)
    end

    def body_process (body, participant)
        body = body.gsub "|% participante %|", participant.name
        body = body.gsub "|% link_itinerario %|", "#{ view_context.link_to edit_participant_itinerary_url(participant, participant.itinerary), request.base_url + edit_participant_itinerary_path(participant, participant.itinerary)}"
        return body
    end

    def mailer_participant_preview
        puts "Mailer participant Preview"
        body = params[:body]
        @participant = Participant.find(params[:participant_id])
        body = body_process body, @participant
        puts "Body"
        puts body
        render json: {
                email: @participant.email, 
                body: body
            }.to_json
    end

    def test_mailer_production
        puts 'Test Mailer production'
        participants = Participant.where(user_id: User.where(email: 'soraya9@gmail.com').first.id)
        to_whom = participants
        subject = "mass mailing test"
        participant = participants.first
        body =  "#{ view_context.link_to edit_participant_itinerary_url(participant, participant.itinerary), request.base_url + edit_participant_itinerary_path(participant, participant.itinerary)}"
        mass_mailer(participants, to_whom, subject, body)
    end

    private
    def mailer_manager_params
        params.require(:admin_mailer_manager).permit(:to_whom, :subject, :body, :eventosbahai_id, event_participant_ids:[])
    end

end
