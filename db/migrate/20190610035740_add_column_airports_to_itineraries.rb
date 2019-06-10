class AddColumnAirportsToItineraries < ActiveRecord::Migration[5.0]
  def change
    add_column :itineraries, :airport_arrival, :string
    add_column :itineraries, :airport_departure, :string
  end
end
