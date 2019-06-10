class AddForeinKeyToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key "user_profiles", "administrative_regions"
  end
end
