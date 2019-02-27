require 'rails_helper'

describe 'background service' do
  it 'exists' do
    lat = 39.9205411
    lon = -105.0866504
    service = BackgroundService.new(lat,lon)

    expect(service).to be_a(BackgroundService)
  end

  it 'returns a response', :vcr do
    lat = 39.9205411
    lon = -105.0866504
    service = BackgroundService.new(lat,lon)
    response = service.parse_response

    expect(response).to have_key(:photos)
    expect(response).to have_key(:stat)
    expect(response[:photos][:photo][0]).to have_key(:id)
    expect(response[:photos][:photo][0]).to have_key(:owner)
    expect(response[:photos][:photo][0]).to have_key(:secret)
    expect(response[:photos][:photo][0]).to have_key(:server)
    expect(response[:photos][:photo][0]).to have_key(:farm)
    expect(response[:photos][:photo][0]).to have_key(:ispublic)
    expect(response[:photos][:photo][0]).to have_key(:isfriend)
    expect(response[:photos][:photo][0]).to have_key(:isfamily)
  end
end
