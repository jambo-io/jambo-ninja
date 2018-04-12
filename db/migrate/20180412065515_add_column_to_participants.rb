class AddColumnToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :publist, :boolean
  end
end
