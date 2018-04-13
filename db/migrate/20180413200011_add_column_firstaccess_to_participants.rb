class AddColumnFirstaccessToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :firstaccess, :boolean, :default => false
  end
end
