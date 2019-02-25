class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :url, :time, :status

  attribute :images do |object|
    object.fetch_giphy_gifs
  end

end
