class CreateAdminMailerReports < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_mailer_reports do |t|
      t.references :eventosbahai, foreign_key: true
      t.references :participant, foreign_key: true
      t.references :admin_mailer_manager, foreign_key: true



      t.timestamps
    end
  end
end
