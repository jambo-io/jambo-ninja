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

        participant_emails = []
        participants.each do |participant|
            participant_emails.push(participant.email)
        end

        @participant_emails = participant_emails.join(", ")

        puts @event.inspect
        @admin_mailer_manager = Admin::MailerManager.new
    end

    def create_mailer_manager
        puts "Inspect 1"
        puts mailer_manager_params
        event = Eventosbahai.find(mailer_manager_params[:eventosbahai_id])

        to_whom = params[:to_whom]
        participants = event.participants
        email_to = []

        participants.each do |participant|
            if(to_whom == "no_itinerary")
                if participant.itinerary.transportation.blank?
                    email_to.push(participant.email)
                end
            else
                email_to.push(participant.email)
            end
        end 
        puts "Inspect 3"
        puts email_to

        mailer = current_user.mailer_managers.new
        puts "INpsect 4"
        puts mailer.inspect
        mailer.to = email_to
        mailer.subject = mailer_manager_params[:subject]
        mailer.body = mailer_manager_params[:body]
        mailer.eventosbahai_id = mailer_manager_params[:eventosbahai_id]
        if mailer.save!
            email_to.each do |participant_email|
                Admin::DashboardMailer.custom_mail(mailer,participant_email).deliver_now
            end
            redirect_to admin_path, notice: 'E-mail enviado!'
        end
    end

    private
    def mailer_manager_params
        params.require(:admin_mailer_manager).permit(:to_whom, :subject, :body, :eventosbahai_id)
    end

end
