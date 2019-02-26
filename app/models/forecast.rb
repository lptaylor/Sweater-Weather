class Forecast
  attr_reader :city, :state, :date
  def initialize(search_location)
    location = search_location.split(',')
    @search_location = search_location
    @date = Time.now.strftime('%Y-%m-%d')
    @city = location[0].strip
    @state = location[1].strip
  end

  def get_lat
    service = GeolocatorService.new(@search_location)
    service.lat
  end

  def get_lon
    service = GeolocatorService.new(@search_location)
    service.lon
  end

  def current_weather
    CurrentWeatherFacade.get_current_weather(get_lat, get_lon)
  end

  def hourly_weather
    HourlyWeatherFacade.get_hourly_weather(get_lat, get_lon)
  end

  def daily_weather
    DaysWeatherFacade.get_daily_weather(get_lat, get_lon)
  end
end
