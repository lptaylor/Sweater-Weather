class UserFavoriteLocations < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_location
end
