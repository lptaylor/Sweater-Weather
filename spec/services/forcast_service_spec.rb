require 'rails_helper'

describe 'forcast service' do
  it 'exists' do
    lat = 39.9205411
    lon = -105.0866504
    service = ForcastService.new(lat,lon)

    expect(service).to be_a(ForcastService)
  end

  it 'gives back a response' do
    
  end
end
