class RenameColumnAdminMailerFromAdminMailerReports < ActiveRecord::Migration[5.0]
  def change
    rename_column :admin_mailer_reports, :admin_mailer_manager_id, :mailer_manager_id
  end
end
