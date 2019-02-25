class GiphyDay
  attr_reader :time, :url, :summary
  def initialize(weather_data)
    @time = weather_data[:time]
    @url = weather_data[:url]
    @summary = weather_data[:summary]
  end
end
