class CreateBemvindos < ActiveRecord::Migration[5.0]
  def change
    create_table :bemvindos do |t|
      t.string :Name
      t.string :lastname
      t.string :email
      t.text :comentarios

      t.timestamps
    end
  end
end
