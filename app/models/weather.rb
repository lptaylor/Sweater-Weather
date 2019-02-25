class Weather
  attr_reader :time, :icon, :temperature
  def initialize(weather_data)
    @time = weather_data[:time]
    @icon = weather_data[:icon]
    @temperature = weather_data[:temperature]
  end
end
