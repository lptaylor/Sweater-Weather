class ImagesSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :url, :time, :status
end
