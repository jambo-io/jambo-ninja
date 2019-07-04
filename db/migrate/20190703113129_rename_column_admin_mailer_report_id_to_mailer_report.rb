class RenameColumnAdminMailerReportIdToMailerReport < ActiveRecord::Migration[5.0]
  def change
    rename_column :mailer_participants, :admin_mailer_report_id, :mailer_report_id
  end
end
