class AddColumnProccessedToAdminMailerReports < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_mailer_reports, :proccessed, :boolean, default: false
  end
end
