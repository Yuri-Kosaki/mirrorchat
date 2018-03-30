class User < ApplicationRecord

  validates :name, :place, :year, uniqueness: true
  validates :name, :place, :year, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i(google)

  has_many :messages, dependent: :destroy
  has_many :groups, through: :members
  has_many :members
  has_many :chats, dependent: :destroy
  has_many :rooms, through: :roommates
  has_many :roommates
  has_many :timelines
  has_many :comments
  has_many :reviews

  accepts_nested_attributes_for :messages, allow_destroy: true

  protected

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta:     auth.to_yaml)
    end
    user
  end
end
