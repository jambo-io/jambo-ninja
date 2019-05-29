class RemoveColumnsImageFromEventosbahais < ActiveRecord::Migration[5.0]
  def change
    remove_column :eventosbahais, :image_file_name
    remove_column :eventosbahais, :image_content_type
    remove_column :eventosbahais, :image_file_size
    remove_column :eventosbahais, :image_updated_at
  end
end
