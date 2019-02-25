class CurrentWeather
  attr_reader :temperature,
              :feels_like_temp,
              :humidity,
              :uv_index,
              :visibility,
              :summary,
              :icon
  def initialize(current_weather_data)
    @temperature = current_weather_data[:currently][:temperature]
    @feels_like_temp = current_weather_data[:currently][:apparentTemperature]
    @humidity = current_weather_data[:currently][:humidity]
    @uv_index = current_weather_data[:currently][:uvIndex]
    @visibility = current_weather_data[:currently][:visibility]
    @summary = current_weather_data[:currently][:summary]
    @icon = current_weather_data[:currently][:icon]
  end
end
