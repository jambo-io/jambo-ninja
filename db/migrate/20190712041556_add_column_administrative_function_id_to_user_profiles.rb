class AddColumnAdministrativeFunctionIdToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :participants, :administrative_function_id
    add_column :user_profiles, :administrative_function_id, :integer
  end
end
