class Message < ApplicationRecord

  validates :text, length: { minimum: 1 }

  belongs_to :group
  belongs_to :user

end
