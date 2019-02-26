require 'rails_helper'

describe 'forecast service' do
  it 'exists' do
    lat = 39.9205411
    lon = -105.0866504
    service = ForecastService.new(lat,lon)

    expect(service).to be_a(ForecastService)
  end

  it 'gives back a response', :vcr do
    lat = '39.9205411'
    lon = '-105.0866504'
    service = ForecastService.new(lat,lon)
    response = service.parse_response

    expect(response).to have_key(:currently)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
  end
end
