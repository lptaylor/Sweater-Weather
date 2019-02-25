class CurrentWeatherFacade
  def self.get_current_weather(lat, lon)
    data = forecastService.new(lat, lon).parse_response
    CurrentWeather.new(data)
  end
end
