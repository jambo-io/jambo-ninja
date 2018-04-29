class AddColumnToRuhibookuserId < ActiveRecord::Migration[5.0]
  def change
    add_reference :ruhibooks, :user, foreign_key: true
  end
end
