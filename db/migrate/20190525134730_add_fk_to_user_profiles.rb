class AddFkToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :user_profiles, :users
  end
end
