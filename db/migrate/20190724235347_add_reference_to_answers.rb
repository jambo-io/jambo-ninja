class AddReferenceToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :eventosbahai, foreign_key: true
  end
end
