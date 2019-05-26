class ChangeColumnDefaultParticipants < ActiveRecord::Migration[5.0]
  def change
    change_column_default :participants, :firstaccess, :true
  end
end
