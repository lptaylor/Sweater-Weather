class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :api_key, presence: true, uniqueness: true
  has_many :user_favorite_locations
  has_many :favorite_locations, through: :user_favorite_locations
end
