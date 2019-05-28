class ChangeTransportationToBeIntegerInItineraries < ActiveRecord::Migration[5.0]
  def change
    change_column :itineraries, :transportation, :integer, using: 'transportation::integer'
  end
end
