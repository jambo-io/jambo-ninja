class AddColumnToEventosbahais < ActiveRecord::Migration[5.0]
  def change
    add_reference :eventosbahais, :user, foreign_key: true
  end
end
