class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :participant
  belongs_to :eventosbahai
end
