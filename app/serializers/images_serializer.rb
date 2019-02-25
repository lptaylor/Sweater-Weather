class ImagesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :url, :time, :summary
end
