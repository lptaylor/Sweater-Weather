class GifsSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attribute :images do |object|
    object.make_giphy_days
  end
end
