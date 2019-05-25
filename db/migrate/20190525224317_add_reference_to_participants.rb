class AddReferenceToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_reference :participants, :user, foreign_key: true
  end
end
