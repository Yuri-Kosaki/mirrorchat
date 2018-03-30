class Review < ApplicationRecord
  belongs_to :timeline
  belongs_to :user
end
