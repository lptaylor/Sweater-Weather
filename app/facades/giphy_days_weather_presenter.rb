class GiphyDaysWeatherPresenter
  def initialize(location)
    @location = location
    @lat = get_lat
    @lon = get_lon
  end

  def fetch_giphy_gifs
    five_day_with_gif = {}
    array = []
    five_day_forecast.each do |forecast|
        five_day_with_gif[:url] = GiphyService.new(forecast.icon).get_gif
        five_day_with_gif[:time] = forecast.day
        five_day_with_gif[:summary] = forecast.icon
        array << five_day_with_gif
    end
    array
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

  def make_giphy_days
    fetch_giphy_gifs.map do |data|
      GiphyDay.new(data)
    end
  end
end
