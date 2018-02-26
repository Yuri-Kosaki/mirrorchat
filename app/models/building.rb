class Building < ApplicationRecord

  validates :facility, :explanation, :access, :telephone_number, presence: true
  validates :facility, uniqueness: true
end
