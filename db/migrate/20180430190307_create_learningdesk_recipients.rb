class CreateLearningdeskRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :learningdesk_recipients do |t|
      t.references :learningdesk_report, foreign_key: true
      t.references :learningdesk_contact, foreign_key: true
      t.string :mode

      t.timestamps
    end
  end
end
