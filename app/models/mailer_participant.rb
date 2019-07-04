class MailerParticipant < ApplicationRecord
  belongs_to :admin_mailer_report, optional: true
  belongs_to :participant
end
