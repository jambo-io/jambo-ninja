class CreateAdministrativeFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :administrative_functions do |t|
      t.string :name

      t.timestamps
    end
  end
end
