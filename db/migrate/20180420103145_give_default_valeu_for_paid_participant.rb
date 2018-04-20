class GiveDefaultValeuForPaidParticipant < ActiveRecord::Migration[5.0]
  def change
    change_column :participants, :paid, :boolean, default: false
  end
end
