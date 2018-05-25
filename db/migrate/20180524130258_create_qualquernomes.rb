class CreateQualquernomes < ActiveRecord::Migration[5.0]
  def change
    create_table :qualquernomes do |t|

      t.timestamps
    end
  end
end
