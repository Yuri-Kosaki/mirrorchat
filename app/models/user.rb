class User < ApplicationRecord

  validates :name, :place, :year, uniqueness: true
  validates :name, :place, :year, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages, dependent: :destroy
  has_many :groups, through: :members
  has_many :members
  has_many :chats, dependent: :destroy
  has_many :rooms, through: :roommates
  has_many :roommates
  has_many :timelines
  has_many :comments
  has_many :reviews


  has_attached_file :image, styles: { original: "100x100>", short: "70x70>", medium: "50x50#", thumb: "30x30#"}, default_url: "/images/:style/Masketeer.png", path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
url:"/system/:class/image/:id.:style.:extension"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"]}

end
