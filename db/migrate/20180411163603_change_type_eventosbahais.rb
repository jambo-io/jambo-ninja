class ChangeTypeEventosbahais < ActiveRecord::Migration[5.0]
  def change
  	change_column :eventosbahais, :sendemail, :text
  end
end
