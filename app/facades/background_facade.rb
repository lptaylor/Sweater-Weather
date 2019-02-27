class BackgroundFacade
  attr_reader :location
  def initialize(location)
    @location = location
    @lat = get_lat
    @lon = get_lon
  end

  def get_lat
    service = GeolocatorService.new(@location)
    service.lat
  end

  def get_lon
    service = GeolocatorService.new(@location)
    service.lon
  end

  def make_background
    data = BackgroundService.new(@lat, @lon).get_background
    Background.new(data)
  end

  def show_url
    make_background.build_url
  end
end
