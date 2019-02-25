class GiphyDaysWeather
  def initialize(five_day_forecast)
    @five_day_forecast = five_day_forecast
  end

  def fetch_giphy_gifs
    five_day_with_gif = {}
    @five_day_forecast.map do |forecast|
        five_day_with_gif[:url] = GiphyService.new(forecast[:icon]).get_gif
        five_day_with_gif[:time] = forecast[:day]
        five_day_with_gif[:status] = forecast[:icon]
    end
    five_day_with_gif
  end
end
