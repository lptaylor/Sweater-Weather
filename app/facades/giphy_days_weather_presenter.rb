class GiphyDaysWeatherPresenter
  def initialize(location)
    @location = location
    @lat = get_lat
    @lon = get_lon
  end

  def fetch_giphy_gifs
    five_day_forecast.map do |forecast|
      GiphyService.new(forecast.summary).get_gif
    end
  end

  def make_giphy_days
    combine_data.map do |weather, gif|
      GiphyDay.new(weather, gif)
    end
  end

  def combine_data
    (five_day_forecast).zip(fetch_giphy_gifs).to_h
  end

  def get_lat
    service = GeolocatorService.new(@location)
    service.lat
  end

  def get_lon
    service = GeolocatorService.new(@location)
    service.lon
  end

  def five_day_forecast
    DaysWeatherFacade.get_daily_weather(@lat, @lon)
  end


end
