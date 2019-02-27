class Background
  def initialize(image_data)
    @farm_id = image_data[:farm]
    @server_id = image_data[:server]
    @id = image_data[:id]
    @secret = image_data[:secret]
  end

  def build_url
    "https://farm#{@farm_id}.staticflickr.com/#{@server_id}/#{@id}_#{@secret}.jpg"
  end
end
