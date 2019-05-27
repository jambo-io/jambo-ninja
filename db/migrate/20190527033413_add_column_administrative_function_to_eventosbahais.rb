class AddColumnAdministrativeFunctionToEventosbahais < ActiveRecord::Migration[5.0]
  def change
    add_column :eventosbahais, :administrative_function, :boolean
  end
end
