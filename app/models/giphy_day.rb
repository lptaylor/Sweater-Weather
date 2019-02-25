class GiphyDay
  def initialize(weather_data)
    @time = weather_data[:time]
    @url = weather_data[:url]
    @summary = weather_data[:summary]
  end
end
