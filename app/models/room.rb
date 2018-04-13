class Room < ApplicationRecord
  has_many :users, through: :roommates
  has_many :roommates
  has_many :chats

  accepts_nested_attributes_for :chats, allow_destroy: true

  def friends
    room = self.primary_key = "room_id"
    users.each do |user|
      room += "#{user.name}"
    end
    return room
  end
end
