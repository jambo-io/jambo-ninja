class AddContactToLearningdeskRecipients < ActiveRecord::Migration[5.0]
  def change
    add_column :learningdesk_recipients, :contact_id, :integer
  end
end
