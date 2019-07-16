class Admin::DashboardMailer < ApplicationMailer
    def custom_mail (mailer, participant, body)
        
        @mail = mailer
        @event = @mail.eventosbahai
     
        subject = @mail.subject
        #mail(to: participant_email, subject: subject)
        puts "Sending Email to"
        puts participant.email
        puts "<===========>"
        puts body
        @body = body
        mail(to: participant.email, subject: subject)
    end
end
