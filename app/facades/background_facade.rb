class BackgroundFacade
  def self.get_url(lat, lon)
    data = BackgroundService.new(lat, lon).get_background
    Background.new(data)
  end
end
