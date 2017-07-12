class AddPrivilegesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :privileges, :int
  end
end
