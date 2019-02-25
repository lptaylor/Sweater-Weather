class GiphyDaysWeather
  def initialize(five_day_forecast)
    @five_day_forecast = five_day_forecast
  end

  def fetch_giphy_gifs
    five_day_with_gif = {}
    array = []
    @five_day_forecast.each do |forecast|
        five_day_with_gif[:url] = GiphyService.new(forecast.icon).get_gif
        five_day_with_gif[:time] = forecast.day
        five_day_with_gif[:summary] = forecast.icon
        array << five_day_with_gif
    end
    array
  end

  def make_giphy_days
    fetch_giphy_gifs.map do |data|
      GiphyDay.new(data)
    end
  end
end
