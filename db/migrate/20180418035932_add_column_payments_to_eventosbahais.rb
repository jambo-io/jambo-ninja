class AddColumnPaymentsToEventosbahais < ActiveRecord::Migration[5.0]
  def change
    add_column :eventosbahais, :payment, :text
  end
end
