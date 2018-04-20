class AddColumnToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :pin, :integer
  end
end
