class Admin::MailerManager < ApplicationRecord
    belongs_to :eventosbahai
    belongs_to :user
end
