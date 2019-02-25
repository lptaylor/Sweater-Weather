class GiphyService

  def initialize(weather_summary)
    @weather_summary = weather_summary
  end

  def conn
    Faraday.new(url => 'api.giphy.com/v1/gifs/search') do |c|
      c.params[:api_key] = ENV['GIPHY_API_KEY']
      c.adapter  Faraday.default_adapter
    end
  end

  def find_weather_gif
    conn.get("/gifs/search") do |f|
      f.params = @weather_summary
    end
  end

  def parse_response
    JSON.parse(find_weather_gif.body, symbolize_names: true)
  end

  def get_gif
    parse_response[:data][0][:url]
  end
end
