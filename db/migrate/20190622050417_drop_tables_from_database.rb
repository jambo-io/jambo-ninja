class DropTablesFromDatabase < ActiveRecord::Migration[5.0]
  def change
    drop_table :conferenciasdeunidades
    drop_table :jambodoc_categories
    drop_table :learningdesk_contacts
    drop_table :learningdesk_recipients
    drop_table :learningdesk_reports
    drop_table :socialusers
  end
end
