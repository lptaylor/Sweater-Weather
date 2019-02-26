require 'rails_helper'

describe 'gif request', :vcr do
  it 'returns a gifs for the weekly forcast on a location' do
    get '/api/v1/gifs?location=denver,co'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:images)
    expect(parsed[:data][:attributes][:images]).to be_a(Array)
    expect(parsed[:data][:attributes][:images].length).to eq(5)
    expect(parsed[:data][:attributes][:images][0]).to have_key(:time)
    expect(parsed[:data][:attributes][:images][0]).to have_key(:url)
    expect(parsed[:data][:attributes][:images][0]).to have_key(:summary)
  end
end
