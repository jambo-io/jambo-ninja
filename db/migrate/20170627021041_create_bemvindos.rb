class CreateBemvindos < ActiveRecord::Migration[5.0]
  def change
    create_table :bemvindos do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.text :comments

      t.timestamps
    end
  end
end
