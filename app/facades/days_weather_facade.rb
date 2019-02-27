class DaysWeatherFacade
  def self.get_daily_weather(lat, lon)
    if cache_empty_daily?
      data = ForecastService.new(lat, lon).parse_response
      cache_result_daily(:daily, DaysWeather.make_forecast_array(data))
      DaysWeather.make_forecast_array(data)
    else
      read_cache_daily
    end
  end
end

private

def cache_result_daily(type, weather_data)
  Rails.cache.write(type, weather_data , expires_in: 12.hours)
end

def cache_empty_daily?
  Rails.cache.read(:daily).nil?
end

def read_cache_daily
  Rails.cache.read(:daily)
end
