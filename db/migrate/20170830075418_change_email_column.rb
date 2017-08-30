class ChangeEmailColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column :bemvindos, :email, :string, :null => false
  end
end
