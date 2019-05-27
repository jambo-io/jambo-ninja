class AddColumnShareToEventosbahais < ActiveRecord::Migration[5.0]
  def change
    add_column :eventosbahais, :share, :boolean
  end
end
