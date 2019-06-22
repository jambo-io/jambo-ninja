class CreateAdminMailerManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_mailer_managers do |t|
      t.string :to
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
