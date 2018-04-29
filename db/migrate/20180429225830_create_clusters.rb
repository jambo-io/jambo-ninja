class CreateClusters < ActiveRecord::Migration[5.0]
  def change
    create_table :clusters do |t|
      t.string :name
      t.string :city
      t.string :state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
