class AddCityToBemvindos < ActiveRecord::Migration[5.0]
  def change
  	add_column :bemvindos, :city, :string
  end
end
