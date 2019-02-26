class FavoriteLocation < ApplicationRecord
  validates :location, presence: true
  has_many :user_favorite_locations
  has_many :users, through: :user_favorite_locations
end
