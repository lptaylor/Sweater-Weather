class Forcast
  def initialize(search_location)
    location = search_location.split(',')
    @search_location = search_location
    @date = Time.now.strftime('%Y-%m-%d')
    @city = location[0]
    @state = location[1]
  end

  def get_lat
    service = GeolocatorService.new(search_location)
    service.lat
  end

  def get_lon
    service = GeolocatorService.new(search_location)
    service.lon
  end

  def current_weather
    
  end
end
