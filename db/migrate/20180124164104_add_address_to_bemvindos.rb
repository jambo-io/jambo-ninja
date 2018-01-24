class AddAddressToBemvindos < ActiveRecord::Migration[5.0]
  def change
    add_column :bemvindos, :address, :string
  end
end
