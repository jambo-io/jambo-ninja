class AddSendemailToEventosbahais < ActiveRecord::Migration[5.0]
  def change
    add_column :eventosbahais, :sendemail, :string
  end
end
