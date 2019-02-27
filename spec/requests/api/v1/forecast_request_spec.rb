require 'rails_helper'

describe 'forcast request' do
  it "can return current_weather", :vcr do
    get '/api/v1/forecast?location=denver,colorado'

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:date)
    expect(parsed[:data][:attributes]).to have_key(:city)
    expect(parsed[:data][:attributes]).to have_key(:state)
    expect(parsed[:data][:attributes]).to have_key(:current_weather)
    expect(parsed[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(parsed[:data][:attributes][:current_weather]).to have_key(:feels_like_temp)
    expect(parsed[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(parsed[:data][:attributes][:current_weather]).to have_key(:uv_index)
    expect(parsed[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(parsed[:data][:attributes][:current_weather]).to have_key(:summary)
    expect(parsed[:data][:attributes][:current_weather]).to have_key(:icon)
  end
  it "can return daily_weather", :vcr do
    get 'https://enigmatic-everglades-87289.herokuapp.com/api/v1/forecast?location=denver,colorado'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:date)
    expect(parsed[:data][:attributes]).to have_key(:city)
    expect(parsed[:data][:attributes]).to have_key(:state)
    expect(parsed[:data][:attributes]).to have_key(:days_weather)
    expect(parsed[:data][:attributes][:days_weather]).to be_a(Array)
    expect(parsed[:data][:attributes][:days_weather].length).to eq(5)
    expect(parsed[:data][:attributes][:days_weather][0]).to have_key(:day)
    expect(parsed[:data][:attributes][:days_weather][0]).to have_key(:icon)
    expect(parsed[:data][:attributes][:days_weather][0]).to have_key(:precipitaion_chance)
    expect(parsed[:data][:attributes][:days_weather][0]).to have_key(:precipitaion_type)
    expect(parsed[:data][:attributes][:days_weather][0]).to have_key(:high_temp)
    expect(parsed[:data][:attributes][:days_weather][0]).to have_key(:low_temp)
  end
  it "can return hourly_weather", :vcr do
    get 'https://enigmatic-everglades-87289.herokuapp.com/api/v1/forecast?location=denver,colorado'

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:date)
    expect(parsed[:data][:attributes]).to have_key(:city)
    expect(parsed[:data][:attributes]).to have_key(:state)
    expect(parsed[:data][:attributes]).to have_key(:hourly_weather)
    expect(parsed[:data][:attributes][:hourly_weather]).to be_a(Array)
    expect(parsed[:data][:attributes][:hourly_weather].length).to eq(8)
    expect(parsed[:data][:attributes][:hourly_weather][0]).to have_key(:time)
    expect(parsed[:data][:attributes][:hourly_weather][0]).to have_key(:icon)
    expect(parsed[:data][:attributes][:hourly_weather][0]).to have_key(:temperature)
  end
end
