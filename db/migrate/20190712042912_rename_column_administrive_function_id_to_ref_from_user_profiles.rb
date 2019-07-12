class RenameColumnAdministriveFunctionIdToRefFromUserProfiles < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_profiles, :administrative_region_ref, :administrative_region_ref
    rename_column :user_profiles, :administrative_function_id, :administrative_function_ref
  end
end
