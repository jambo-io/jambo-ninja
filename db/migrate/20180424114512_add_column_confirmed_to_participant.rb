class AddColumnConfirmedToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :phoneconfirmed, :boolean
  end
end
