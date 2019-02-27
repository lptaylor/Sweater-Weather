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
    if cache_empty_forecast?(:current)
      cache_result(:current, CurrentWeatherFacade.get_current_weather(get_lat, get_lon), 5.minutes)
      CurrentWeatherFacade.get_current_weather(get_lat, get_lon)
    else
      read_cache_forecast(:current)
    end
  end

  def hourly_weather
    if cache_empty_forecast?(:hourly)
      cache_result(:hourly, HourlyWeatherFacade.get_hourly_weather(get_lat, get_lon), 30.minutes)
      HourlyWeatherFacade.get_hourly_weather(get_lat, get_lon)
    else
      read_cache_forecast(:hourly)
    end
  end

  def daily_weather
    if cache_empty_forecast?(:daily)
      cache_result(:daily, DaysWeatherFacade.get_daily_weather(get_lat, get_lon), 12.hours)
      DaysWeatherFacade.get_daily_weather(get_lat, get_lon)
    else
      read_cache_forecast(:daily)
    end
  end
end

private

def cache_result(type, weather_data, expires_in)
  Rails.cache.write(type, weather_data , expires_in: expires_in)
end

def cache_empty_forecast?(type)
  Rails.cache.read(type).nil?
end

def read_cache_forecast(type)
  Rails.cache.read(type)
end
