class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :state
      t.string :city
      t.string :address
      t.string :number
      t.string :pc
      t.string :activities
      t.boolean :video

      t.timestamps
    end
  end
end
