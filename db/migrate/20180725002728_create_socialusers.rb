class CreateSocialusers < ActiveRecord::Migration[5.0]
  def change
    create_table :socialusers do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
