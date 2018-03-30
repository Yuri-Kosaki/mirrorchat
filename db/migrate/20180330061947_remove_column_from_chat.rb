class RemoveColumnFromChat < ActiveRecord::Migration[5.0]
  def change
    remove_column :chats, :image, :string
  end
end
