class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :lastname
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :state
      t.string :city
      t.string :address
      t.integer :number
      t.string :zipcode

      t.timestamps
    end
  end
end
