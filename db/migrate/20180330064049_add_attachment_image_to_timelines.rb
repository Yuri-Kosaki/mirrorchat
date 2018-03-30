class AddAttachmentImageToTimelines < ActiveRecord::Migration[5.0]
  def self.up
    change_table :timelines do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :timelines, :image
  end
end
