class Building < ApplicationRecord

  validates :facility, presence: true
  validates :explanation, presence: true
  validates :access, presence: true
  validates :telephone_number, presence: true
end
