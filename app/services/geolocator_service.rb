class GeolocatorService
  def initialize(location)
    @location = location
  end

  def conn
    Faraday.new(:url => 'https://maps.googleapis.com/maps/api/geocode/json') do |c|
      c.params[:key] = ENV['GOOGLE_API_KEY']
      c.adapter  Faraday.default_adapter
    end
  end

  def geolocation
    conn.get do |geolocate|
      geolocate.params[:address] = @location
    end
  end

  def parse_response
    JSON.parse(geolocation.body, symbolize_names: true)
  end

  def location_data
    parse_response[:results].first[:geometry][:location]
  end

  def lat
    location_data[:lat]
  end

  def lon
    location_data[:lng]
  end
end
