class AddColumnFullNameToUserProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :user_profiles, :fullname, :string
  end
end
