class AddFkUsersToEventosBahai < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :eventosbahais, :users
  end
end
