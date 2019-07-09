class Itinerary < ApplicationRecord
  belongs_to :participant, optional: true

  enum transportation: [:carro, :ônibus, :avião]

  def has_company?
    if (self.transportation == "avião" || 
        self.transportation == "ônibus") && self.company.present?
      return true
    end
    return false
  end

  def has_flight_number?
    if self.transportation == "avião" && self.flight_number.present?
      return true
    end
    return false
  end

  def has_arrival_airport?
    if self.transportation == "avião" && self.airport_arrival.present?
      return true
    end
    return false
  end

  def has_departure?
    if (self.transportation == "avião" || 
      self.transportation == "ônibus" || self.transportation == "carro") && self.departure.present?
      return true
    end
    return false
  end

  def has_departure_airport?
    if self.transportation == "avião" && self.airport_departure.present?
      return true
    end
    return false
  end

end
