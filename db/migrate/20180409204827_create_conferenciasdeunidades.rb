class CreateConferenciasdeunidades < ActiveRecord::Migration[5.0]
  def change
    create_table :conferenciasdeunidades do |t|
      t.string :name
      t.string :location
      t.date :start_at
      t.date :end_at
      t.text :description

      t.timestamps
    end
  end
end
