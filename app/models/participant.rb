class Participant < ApplicationRecord
  belongs_to :eventosbahai
  validates :contact, presence: true, length: { minimum:5 }
  validates :name, presence: true, length: { minimum:2 }

end
