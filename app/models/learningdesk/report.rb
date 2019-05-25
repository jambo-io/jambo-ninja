class Learningdesk::Report < ApplicationRecord
  belongs_to :user
  has_many :learningdesk_recipients, :class_name => 'Learningdesk::Recipient', :dependent => :destroy
end
