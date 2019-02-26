require 'rails_helper'
descibe 'favorite location request' do
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
end
