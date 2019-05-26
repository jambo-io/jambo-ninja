class Itinerary < ApplicationRecord
  belongs_to :participant, optional: true

  enum transportation: [:carro, :ônibus, :avião]
end
