class Group < ApplicationRecord


  has_many :messages, dependent: :destroy
  has_many :users, through: :members
  has_many :members

  accepts_nested_attributes_for :messages, allow_destroy: true

  def memberlist
    str = "Member: "
    users.each do |user|
      str += "#{user.name}"
    end
    return str
  end
end
