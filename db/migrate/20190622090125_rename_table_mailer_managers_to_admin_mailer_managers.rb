class RenameTableMailerManagersToAdminMailerManagers < ActiveRecord::Migration[5.0]
  def change
    rename_table :mailer_managers, :admin_mailer_managers
  end
end
