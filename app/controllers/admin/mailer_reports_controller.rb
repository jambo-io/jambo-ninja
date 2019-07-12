class Admin::MailerReportsController < Admin::AdminController
    before_action :is_admin?
    before_action only: [:new] do 
        is_owner? ('Eventosbahai')
    end

    def new
        @event = Eventosbahai.find(params[:id])
        @participants = @event.participants
        @one_participant = @participants.first
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
        @admin_mailer_report = Admin::MailerReport.new
    end

    def index
        @mailer_reports = current_user.mailer_reports
    end

    def create
        participant_ids = params[:event][:participant_ids]
        participant_ids = participant_ids.reject(&:blank?)
        event = Eventosbahai.find(admin_mailer_report_params[:eventosbahai_id])
        to_whom = params[:to_whom]
        participants = Participant.find(participant_ids)
        if participants.blank?
            redirect_to admin_path, alert: 'Nenhum E-mail foi enviado. Verifique se os destinatários foram selecionados.'
            return false
        end
        subject = admin_mailer_report_params[:subject]
        body = admin_mailer_report_params[:body]
        mass_mailer(event, participants, to_whom, subject, body)
    end

    def show
        @mailer_report = Admin::MailerReport.find(params[:id])
        @event = Eventosbahai.find(@mailer_report.eventosbahai_id)
        @participants = @mailer_report.participants
        
        @sent_emails = @event.mailer_reports
    end

    def true?(obj)
        obj.to_s.downcase == "true"
    end

    def send_email
        # params
        participant = Participant.find(params[:participant_id])
        last_participant = params[:last_participant] # => Last from the frontend
        mailer_report_id = params[:mailer_report_id]
        mailer = Admin::MailerReport.find(params[:mailer_report_id])

        mailer_participant = MailerParticipant.where(participant_id: participant.id, mailer_report_id: mailer_report_id).first

        # No participant were selected
        if(participant.blank?)
            render json: {
                message: "No Participant Found"
            }
            return false
        end

        # Verify if it's the second time it's executing
        body = body_process(mailer.body, participant)
        if(mailer.proccessed == true)
            render json: {
                message: "Sent Before"
            }
            return nil
        end

        # Verify if it's the last participant from the frontend
        if true?(last_participant)
            mailer.proccessed = true
            mailer.save!
        end
       
        # Double check to see if it's already been sent before sending the E-mail
        if(mailer_participant.sent == false || mailer_participant.sent.blank?)
            puts "Mailer Participant New"
            send = Admin::DashboardMailer.custom_mail(mailer,participant, body).deliver_now
            mailer_participant.update(sent: true)

            render json: {
                message: "Ok"
            }
        else
            render json: {
                message: "Sent Before"
            }
        end
    end

    def body_process (body, participant)
        body = body.gsub "|% participante %|", participant.name
        body = body.gsub "|% link_itinerario %|", "#{ view_context.link_to edit_participant_itinerary_url(participant, participant.itinerary), request.base_url + edit_participant_itinerary_path(participant, participant.itinerary)}"
        return body
    end

    def mailer_participant_preview
        body = params[:body]
        @participant = Participant.find(params[:participant_id])
        body = body_process body, @participant
        render json: {
                email: @participant.email, 
                body: body
            }.to_json
    end

    def test_mailer_production
        participants = Participant.where(user_id: User.where(email: 'soraya9@gmail.com').first.id)
        to_whom = participants
        participant = participants.first
        body =  "#{ view_context.link_to edit_participant_itinerary_url(participant, participant.itinerary), request.base_url + edit_participant_itinerary_path(participant, participant.itinerary)}"
        event = Eventosbahai.last
        mass_mailer(event, participants, to_whom, subject, body)
    end

    def mass_mailer(event, participants, to_whom, subject, body)
        mailer = current_user.mailer_reports.new
        mailer.subject = subject
        mailer.body = body
        mailer.eventosbahai_id = event.id
               
        if mailer.save!
            participants.each do |participant|
                # Config Body
                puts participant.inspect
                body = body_process admin_mailer_report_params[:body], participant
                mailer.body = body

                mailer_participant = MailerParticipant.new
                mailer_participant.mailer_report_id = mailer.id
                mailer_participant.participant_id = participant.id
                puts mailer_participant.inspect
                mailer_participant.save!
                   
            end
            puts mailer.inspect
            redirect_to admin_mailer_report_path(mailer), notice: 'Configurações de E-mail salvas.'
        end
    end

    private

    def admin_mailer_report_params
        params.require(:admin_mailer_report).permit(:to_whom, :subject, :body, :eventosbahai_id, event_participant_ids:[])
    end
   
end