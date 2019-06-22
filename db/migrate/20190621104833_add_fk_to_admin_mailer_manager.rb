class AddFkToAdminMailerManager < ActiveRecord::Migration[5.0]
  def change
    add_reference :admin_mailer_managers, :eventosbahai, foreign_key: true
    add_reference :admin_mailer_managers, :user, foreign_key: true
  end
end
