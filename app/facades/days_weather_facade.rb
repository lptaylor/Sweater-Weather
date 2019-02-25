class DaysWeatherFacade
  def self.get_daily_weather(lat, lon)
    data = ForcastService.new(lat, lon).parse_response
    DaysWeather.new(data)
  end
end
