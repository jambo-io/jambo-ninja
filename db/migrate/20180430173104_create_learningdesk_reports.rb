class CreateLearningdeskReports < ActiveRecord::Migration[5.0]
  def change
    create_table :learningdesk_reports do |t|
      t.string :title
      t.text :report
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
