class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :lastname
      t.string :contact
      t.date :birthday
      t.string :address
      t.string :city
      t.string :state
      t.references :eventosbahais, foreign_key: true

      t.timestamps
    end
  end
end
