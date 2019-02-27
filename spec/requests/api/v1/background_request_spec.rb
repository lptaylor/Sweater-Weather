require 'rails_helper'

describe 'background image request' do
  it 'returns an image based on locaion', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:url)
    expect(parsed[:data][:attributes]).to have_key(:location)
  end
end
