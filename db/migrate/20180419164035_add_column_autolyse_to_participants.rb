class AddColumnAutolyseToParticipants < ActiveRecord::Migration[5.0]
  def change
	add_column :participants, :autolyse, :string
  end
end
