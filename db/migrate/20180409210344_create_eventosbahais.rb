class CreateEventosbahais < ActiveRecord::Migration[5.0]
  def change
    create_table :eventosbahais do |t|
      t.string :name
      t.date :start_at
      t.date :end_at
      t.string :city
      t.string :state
      t.string :location
      t.string :theme
      t.string :description
      t.float :price
      t.integer :vacancies

      t.timestamps
    end
  end
end
