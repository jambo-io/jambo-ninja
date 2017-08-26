class ChangePrivilegesToBeStringInUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :privileges, :string
  end
end
