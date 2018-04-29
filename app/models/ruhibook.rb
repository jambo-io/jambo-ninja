class Ruhibook < ApplicationRecord
  belongs_to :user
  serialize :name
end
