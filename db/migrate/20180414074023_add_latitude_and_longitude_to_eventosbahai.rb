class AddLatitudeAndLongitudeToEventosbahai < ActiveRecord::Migration[5.0]
  def change
    add_column :eventosbahais, :latitude, :float
    add_column :eventosbahais, :longitude, :float
  end
end
