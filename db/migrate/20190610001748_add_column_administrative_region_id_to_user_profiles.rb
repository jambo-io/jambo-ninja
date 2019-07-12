class AddColumnAdministrativeRegionIdToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :user_profiles, :administrative_region_ref, :integer, foreign_key: true
  end
end
