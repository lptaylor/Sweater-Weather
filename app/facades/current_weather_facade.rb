class CurrentWeatherFacade
  def self.get_current_weather(lat, lon)
    if cache_empty_current_forecast?
      data = ForecastService.new(lat, lon).parse_response
      cache_result_current_forecast(:current, CurrentWeather.new(data))
      CurrentWeather.new(data)
    else
      read_cache_current_forecast
    end
  end
end

private

def cache_result_current_forecast(type, weather_data)
  Rails.cache.write(type, weather_data , expires_in: 5.minutes)
end

def cache_empty_current_forecast?
  Rails.cache.read(:current).nil?
end

def read_cache_current_forecast
  Rails.cache.read(:current)
end
