class AddRoomIdToChats < ActiveRecord::Migration[5.0]
  def change
    add_reference :chats, :room
  end
end
