require 'rails_helper'
describe 'favorite location request' do
  it 'can add a favorite location' do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    user = User.first
    post "/api/v1/favorites?location=Denver,CO&api_key=#{user.api_key}"

    parsed = JSON.parse(response.body)

    expect(response).to be_successful
    expect(parsed['status']).to eq(201)
  end
  it 'cannot add a favorite location without valid api_key' do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    post "/api/v1/favorites?location=Denver,CO&api_key=taco"

    parsed = JSON.parse(response.body)
    expect(response).to be_successful
    expect(parsed['status']).to eq(401)
  end
  it 'lists at least one favorite locations for a user', :vcr do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    user = User.first
    post "/api/v1/favorites?location=Denver,CO&api_key=#{user.api_key}"
    get "/api/v1/favorites?api_key=#{user.api_key}"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:data)
    expect(parsed[:data][0]).to have_key(:id)
    expect(parsed[:data][0]).to have_key(:type)
    expect(parsed[:data][0]).to have_key(:attributes)
    expect(parsed[:data][0][:attributes]).to have_key(:location)
    expect(parsed[:data][0][:attributes]).to have_key(:current_weather)
  end
  it 'lists all favorite locations for a user', :vcr do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    user = User.first
    post "/api/v1/favorites?location=Denver,CO&api_key=#{user.api_key}"
    post "/api/v1/favorites?location=Boulder,CO&api_key=#{user.api_key}"
    get "/api/v1/favorites?api_key=#{user.api_key}"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed).to have_key(:data)
    expect(parsed[:data][0]).to have_key(:id)
    expect(parsed[:data][0]).to have_key(:type)
    expect(parsed[:data][0]).to have_key(:attributes)
    expect(parsed[:data][0][:attributes]).to have_key(:location)
    expect(parsed[:data][0][:attributes]).to have_key(:current_weather)
    expect(parsed[:data][1]).to have_key(:id)
    expect(parsed[:data][1]).to have_key(:type)
    expect(parsed[:data][1]).to have_key(:attributes)
    expect(parsed[:data][1][:attributes]).to have_key(:location)
    expect(parsed[:data][1][:attributes]).to have_key(:current_weather)
  end
  it 'returns a 400 status if api_key is not correct' do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    user = User.first
    post "/api/v1/favorites?location=Denver,CO&api_key=#{user.api_key}"
    post "/api/v1/favorites?location=Boulder,CO&api_key=#{user.api_key}"
    get "/api/v1/favorites?api_key=taco"

    parsed = JSON.parse(response.body)

    expect(response).to be_successful
    expect(parsed['status']).to eq(401)
  end
end
