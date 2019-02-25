class GiphyDaysWeather
  def self.assign_gifs(five_day_forecast, gifs)
    five_day_forecast[:data][:attributes].map do |data|
      GiphyDay.new(data, )
    end
  end

  def fetch_giphy_gifs(five_day_forecast)
    five_day_forecast[:data][:attributes].map do |forecast|
      GiphyService.new([:icon]).get_gif
    end
  end
end
