class CreateMailerParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :mailer_participants do |t|
      t.references :admin_mailer_report, foreign_key: true
      t.references :participant, foreign_key: true
      t.boolean :sent

      t.timestamps
    end
  end
end
