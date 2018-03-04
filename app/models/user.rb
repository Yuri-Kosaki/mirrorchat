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

  accepts_nested_attributes_for :messages, allow_destroy: true
end
