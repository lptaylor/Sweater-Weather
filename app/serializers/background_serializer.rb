class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :location

  attribute :url do |object|
    object.show_url
  end

end
