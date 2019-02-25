require 'rails_helper'

describe 'giphy service' do
  before(:each) do
    weather_summary = 'sunny'
    @service = GiphyService.new(weather_summary)
  end
  it 'exists' do
    expect(@service).to be_a(GiphyService)
  end
  it 'has response body with keys', :vcr do

    response = @service.parse_response
    expect(response).to have_key(:currently)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:daily)
  end
end
