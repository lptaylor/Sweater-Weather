require 'rails_helper'

describe 'giphy service' do
  before(:each) do
    weather_summary = 'sunny'
    @service = GiphyService.new(weather_summary)
    @response = @service.parse_response
  end
  it 'exists' do
    expect(@service).to be_a(GiphuyService)
  end
  it 'has response body with keys', :vcr do
    expect(@response).to have_key(:currently)
    expect(@response).to have_key(:hourly)
    expect(@response).to have_key(:daily)
  end
end
