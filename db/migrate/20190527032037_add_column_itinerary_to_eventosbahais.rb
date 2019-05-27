class AddColumnItineraryToEventosbahais < ActiveRecord::Migration[5.0]
  def change
    add_column :eventosbahais, :itinerary, :boolean
  end
end
