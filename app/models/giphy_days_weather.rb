class GiphyDaysWeather
  def initialize(five_day_forecast)
    @five_day_forecast = five_day_forecast[:data][:attributes][:days_weather]
  end

  def assign_gifs
    @five_day_forecast.map do |data|
      GiphyDay.new(data, )
    end
  end

  def fetch_giphy_gifs
    five_day_with_gif = {}
    @five_day_forecast.map do |forecast|
        five_day_with_gif[:url] = GiphyService.new(forecast[:icon]).get_gif
        five_day_with_gif[:day] = forecast[:day]
        five_day_with_gif[:icon] = forecast[:icon]
    end
    five_day_with_gif
  end
end
