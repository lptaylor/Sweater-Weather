class HourlyWeatherFacade
  def self.get_hourly_weather(lat, lon)
    data = ForcastService.new(lat, lon).parse_response
    HourlyWeather.make_hourly_array(data)
  end
end
