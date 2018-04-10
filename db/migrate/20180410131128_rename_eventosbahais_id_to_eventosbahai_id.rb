class RenameEventosbahaisIdToEventosbahaiId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :participants, :eventosbahais_id, :eventosbahai_id
  end
end
