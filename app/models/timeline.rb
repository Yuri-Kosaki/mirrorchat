class Timeline < ApplicationRecord
  has_many :reviews
  belongs_to :user

  accepts_nested_attributes_for :reviews, allow_destroy: true

  has_attached_file :image, styles: { original: "600x600>", medium: "300x300#", thumb: "30x30#"}, default_url: "/images/:style/Masketeer.png", path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
url:"/system/:class/image/:id.:style.:extension"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"]}
end
