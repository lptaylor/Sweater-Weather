class ForcastService

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def get_weather
    Faraday.new(:url => "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@lon}") do |f|
      f.params[:exclude] = 'minutely,alerts,flags'
      f.adapter  Faraday.default_adapter
    end
  end

  def parse_response
    JSON.parse(get_weather.body, symbolize_names: true)
  end
end
