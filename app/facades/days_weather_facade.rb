class DaysWeatherFacade
  def self.get_daily_weather(lat, lon)
    data = ForecastService.new(lat, lon).parse_response
    DaysWeather.make_forecast_array(data)
  end
end
