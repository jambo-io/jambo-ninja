class AddColumnUserIdToAdminMailerReports < ActiveRecord::Migration[5.0]
  def change
    add_reference :admin_mailer_reports, :user, index: true
  end
end
