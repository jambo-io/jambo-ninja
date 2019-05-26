class CreateItineraries < ActiveRecord::Migration[5.0]
  def change
    create_table :itineraries do |t|
      t.string :transportation
      t.string :company
      t.datetime :departure
      t.datetime :arrival
      t.string :flight_number
      t.references :participant, foreign_key: true

      t.timestamps
    end
  end
end
