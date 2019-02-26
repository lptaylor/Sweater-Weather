require 'rails_helper'

describe 'gif request', :vcr do
  it 'returns a gifs for the weekly forcast on a location' do
    get '/api/v1/gifs?location=denver,co'

    parsed = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(response).to be_successful
  end
end
