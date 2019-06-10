class CreateAdministrativeRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :administrative_regions do |t|
      t.string :name

      t.timestamps
    end
  end
end
