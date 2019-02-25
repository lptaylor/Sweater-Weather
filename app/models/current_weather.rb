class CurrentWeather
  attr_reader :temperature,
              :feels_like_temp,
              :humidity,
              :uv_index,
              :visibility,
              :summary,
              :icon
  def initialize(current_weather_data)
    @temperature = current_weather_data[:temperature]
    @feels_like_temp = current_weather_data[:apparentTemperature]
    @humidity = current_weather_data[:humidity]
    @uv_index = current_weather_data[:uvIndex]
    @visibility = current_weather_data[:visibility]
    @summary = current_weather_data[:summary]
    @icon = current_weather_data[:icon]
  end
end
