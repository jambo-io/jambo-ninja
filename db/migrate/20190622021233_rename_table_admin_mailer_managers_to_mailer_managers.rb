class RenameTableAdminMailerManagersToMailerManagers < ActiveRecord::Migration[5.0]
  def change
    rename_table :admin_mailer_managers, :mailer_managers
  end
end
