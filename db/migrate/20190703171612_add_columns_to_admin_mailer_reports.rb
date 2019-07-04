class AddColumnsToAdminMailerReports < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_mailer_reports, :to, :string
    add_column :admin_mailer_reports, :subject, :string
    add_column :admin_mailer_reports, :body, :text
  end
end
