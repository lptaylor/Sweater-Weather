require 'rails_helper'

describe 'background service' do
  it 'exists' do
    lat = 39.9205411
    lon = -105.0866504
    service = BackgroundService.new(lat,lon)

    expect(service).to be_a(BackgroundService)
  end

  it 'returns a response', :vcr do

  end
end
