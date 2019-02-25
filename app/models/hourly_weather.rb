class HourlyWeather

  def self.make_hourly_array(hourly_weather_data)
    hourly_weather_data[:hourly][:data].map do |data|
      Weather.new(data)
    end[0..7]
  end
end
