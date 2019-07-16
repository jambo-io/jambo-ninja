class Question < ApplicationRecord
  belongs_to :eventosbahai
  has_many :answers
end
