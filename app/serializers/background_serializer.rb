class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :location

  attribute :url do |object|
    object.build_url
  end

end
