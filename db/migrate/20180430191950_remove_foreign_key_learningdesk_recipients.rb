class RemoveForeignKeyLearningdeskRecipients < ActiveRecord::Migration[5.0]
  def change
    remove_reference :learningdesk_recipients, :learningdesk_contact, index: true
  end
end
