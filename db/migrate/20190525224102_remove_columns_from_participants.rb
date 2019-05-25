class RemoveColumnsFromParticipants < ActiveRecord::Migration[5.0]
  def change
    remove_column :participants, :name
    remove_column :participants, :lastname
    remove_column :participants, :contact
    remove_column :participants, :birthday
    remove_column :participants, :address
    remove_column :participants, :city
    remove_column :participants, :state
  end
end
