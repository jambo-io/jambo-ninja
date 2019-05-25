class Participant < ApplicationRecord
  belongs_to :eventosbahai
  belongs_to :user
  #validates :contact, presence: true, length: { minimum:5 }
  #validates :name, presence: true, length: { minimum:2 }

  def name
    self.user.user_profile.name unless self.user.blank?
  end

end
