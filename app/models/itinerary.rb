class Itinerary < ApplicationRecord
  belongs_to :participant

  enum transportation: [:carro, :ônibus, :avião]
end
