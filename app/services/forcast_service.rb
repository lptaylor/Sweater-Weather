class ForcastService

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def conn
    Faraday.new(:url => "https://api.darksky.net/forecast/") do |f|
      f.adapter  Faraday.default_adapter
    end
  end

  def get_weather
    conn.get("#{ENV['DARK_SKY_API_KEY']}/#{@lat},#{@lon}") do |c|
      c.params[:exclude] = 'minutely,alerts,flags'
    end
  end

  def parse_response
    JSON.parse(get_weather.body, symbolize_names: true)
  end
end
