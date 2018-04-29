class CreateRuhibooks < ActiveRecord::Migration[5.0]
  def change
    create_table :ruhibooks do |t|
      t.string :name

      t.timestamps
    end
  end
end
