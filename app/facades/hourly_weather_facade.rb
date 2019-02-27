class HourlyWeatherFacade
  def self.get_hourly_weather(lat, lon)
    if cache_empty_hourly?
      data = ForecastService.new(lat, lon).parse_response
      cache_result_hourly(:hourly, HourlyWeather.make_hourly_array(data))
      HourlyWeather.make_hourly_array(data)
    else
      read_cache_hourly
    end
  end
end
private

def cache_result_hourly(type, weather_data)
  Rails.cache.write(type, weather_data , expires_in: 30.minutes)
end

def cache_empty_hourly?
  Rails.cache.read(:hourly).nil?
end

def read_cache_hourly
  Rails.cache.read(:hourly)
end
