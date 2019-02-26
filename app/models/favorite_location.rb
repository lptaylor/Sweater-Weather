class FavoriteLocation < ApplicationRecord
  validates :location, presence: true
  has_many :user_favorite_locations
  has_many :users, through: :user_favorite_locations, dependent: :destroy

  def get_lat
    service = GeolocatorService.new(self.location)
    service.lat
  end

  def get_lon
    service = GeolocatorService.new(self.location)
    service.lon
  end

  def current_weather
    CurrentWeatherFacade.get_current_weather(get_lat, get_lon)
  end
end
