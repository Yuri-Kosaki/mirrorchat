class AddAttachmentImageToChats < ActiveRecord::Migration[5.0]
  def self.up
    change_table :chats do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :chats, :image
  end
end
