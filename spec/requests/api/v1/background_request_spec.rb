require 'rails_helper'

describe 'background image request' do
  it 'returns an image based on locaion', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:id)
  end
end
