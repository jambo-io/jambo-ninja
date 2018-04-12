class AddAttachmentImageToEventosbahais < ActiveRecord::Migration[5.0]
  def self.up
    change_table :eventosbahais do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :eventosbahais, :image
  end
end
