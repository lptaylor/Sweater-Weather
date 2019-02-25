require 'rails_helper'

describe 'geolocator service' do
  it 'exists' do
    location = 'Broomfield, Colorado'
    locator = GeolocatorService.new(location)

    expect(locator).to be_a GeolocatorService
  end
  it 'finds lat and long', :vcr do 
    location = 'Broomfield, Colorado'
    locator = GeolocatorService.new(location)

    expect(locator.lat).to eq(39.9205411)
    expect(locator.lon).to eq(-105.0866504)
  end
end
