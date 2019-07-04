class Admin::MailerReport < ApplicationRecord
  belongs_to :eventosbahai
  has_many :mailer_participants, dependent: :destroy
  has_many :participants, through: :mailer_participants
                          
end
