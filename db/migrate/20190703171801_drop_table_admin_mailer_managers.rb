class DropTableAdminMailerManagers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :admin_mailer_reports,  column: :mailer_manager_id
    drop_table :admin_mailer_managers
  end
end
