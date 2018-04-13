class Group < ApplicationRecord


  has_many :messages, dependent: :destroy
  has_many :users, through: :members
  has_many :members
  has_many :comments

  accepts_nested_attributes_for :messages, allow_destroy: true


  has_attached_file :image, styles: { original: "100x100>", medium: "50x50#", thumb: "30x30#"}, default_url: "/images/:style/Masketeer.png", path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
url:"/system/:class/image/:id.:style.:extension"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"]}

  def memberlist
    str = "Member: "
    users.each do |user|
      str += "#{user.name}"
    end
    return str
  end
end
