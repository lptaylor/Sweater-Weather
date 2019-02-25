require 'rails_helper'

describe 'geolocator service' do
  it 'exists' do
    location = 'Broomfield, Colorado'
    locator = Geolocator.new(location)

    expect(locator).to be_a Geolocator
  end
  it 'finds lat and long' do
    location = 'Broomfield, Colorado'
    locator = Geolocator.new(location)

    expect(locator.lat).to eq(39.9288242)
    expect(locator.lon).to eq(-105.0541269)
  end
end
