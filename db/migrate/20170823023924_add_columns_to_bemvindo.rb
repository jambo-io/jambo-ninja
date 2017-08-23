class AddColumnsToBemvindo < ActiveRecord::Migration[5.0]
  def change
    add_column :bemvindos, :phone, :string
    add_column :bemvindos, :birth, :date
  end
end
