class RemoveTablesFromDatabase < ActiveRecord::Migration[5.0]
  def change
    drop_table :jambodocs
    drop_table :bemvindos
    drop_table :media
    drop_table :contacts
    drop_table :participant_roles
  end
end
