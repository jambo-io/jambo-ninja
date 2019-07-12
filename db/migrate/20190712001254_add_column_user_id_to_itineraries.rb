class AddColumnUserIdToItineraries < ActiveRecord::Migration[5.0]
  def change
    add_column :itineraries, :user_id, :integer
  end
end
