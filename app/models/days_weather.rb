class DaysWeather
  def self.make_forcast_array(daily_weather_data)
    daily_weather_data[:daily][:data].map do |data|
      WeatherDay.new(data)
    end[0..4]
  end
end
