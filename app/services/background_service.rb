class BackgroundService
  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def conn
     Faraday.new('https://api.flickr.com/') do |f|
       f.adapter Faraday.default_adapter
     end
  end

  def get_image
    conn.get('services/rest/') do |c|
      c.params['api_key'] = ENV['FLICKR_API_KEY']
      c.params['method'] = 'flickr.photos.search'
      c.params['sort'] = 'relevance'
      c.params['tags'] = 'skyline,parks,landmarks'
      c.params['lat'] = @lat
      c.params['lon'] = @lon
      c.params['format'] = "json"
      c.params['nojsoncallback'] = 1
      c.params['safe_search'] = 1
      c.params['content_type'] = 1
    end
  end

  def parse_response
    JSON.parse(get_image.body, symbolize_names: true)
  end

  def get_background
    parse_response[:photos][:photo].first
  end


end
