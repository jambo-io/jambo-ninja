class AddColumnAdministrativeFunctionToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_reference :participants, :administrative_function, foreign_key: true
  end
end
