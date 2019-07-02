class Admin::DashboardMailer < ApplicationMailer
    def custom_mail (admin_mailer_manager, participant_email)
        @mail = admin_mailer_manager
        @event = @mail.eventosbahai
        subject = @mail.subject
        #mail(to: participant_email, subject: subject)
        mail(to: "guilhermewnunes@gmail.com", subject: subject)
    end
end
