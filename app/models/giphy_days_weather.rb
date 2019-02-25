class GiphyDaysWeather
  def initialize(five_day_forecast)
    @five_day_forecast = five_day_forecast
  end

  def fetch_giphy_gifs

    @five_day_forecast.map do |forecast|
      binding.pry
        forecast << GiphyService.new(forecast[:icon]).get_gif
    end

  end
end
