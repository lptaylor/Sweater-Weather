class WeatherDay
  attr_reader :day,
              :icon,
              :precipitaion_type,
              :precipitaion_chance,
              :high_temp,
              :low_temp
  def initialize(weather_data)
    @day = weather_data[:time]
    @icon = weather_data[:icon]
    @precipitaion_chance = weather_data[:precipProbability]
    @precipitaion_type = weather_data[:precipType]
    @high_temp = weather_data[:temperatureHigh]
    @low_temp = weather_data[:temperatureLow]
  end
end
