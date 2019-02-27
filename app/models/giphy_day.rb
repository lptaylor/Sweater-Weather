class GiphyDay
  attr_reader :time, :url, :summary
  def initialize(weather, gif)
    @time = weather.day
    @url = gif
    @summary = weather.summary
  end
end
