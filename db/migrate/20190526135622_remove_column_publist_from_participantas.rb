class RemoveColumnPublistFromParticipantas < ActiveRecord::Migration[5.0]
  def change
    remove_column :participants, :publist
  end
end
