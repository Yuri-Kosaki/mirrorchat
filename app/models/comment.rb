class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message
  belongs_to :group


  has_attached_file :image, styles: { original: "1080x1920>", medium: "300x300#", thumb: "30x30#"}, default_url: "/images/:style/Masketeer.png", path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
url:"/system/:class/image/:id.:style.:extension"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"]}
end
