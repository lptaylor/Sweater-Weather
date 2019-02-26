require 'rails_helper'

describe 'user api' do
  it 'can make user' do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    parsed = JSON.parse(response.body)

    expect(response).to be_successful
    expect(parsed).to have_key('api_key')
    expect(parsed).to have_key('status')
  end

  it 'can allow existing user to login' do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    post "/api/v1/sessions?email=lance@gmail.com&password=123abc"

    parsed = JSON.parse(response.body)

    expect(response).to be_successful
    expect(parsed).to have_key('api_key')
    expect(parsed).to have_key('status')
  end

  it 'returns unauthorized if user does not exist' do
    post "/api/v1/sessions?email=lance@gmail.com&password=123abc"

    parsed = JSON.parse(response.body)

    expect(response).to be_successful
    expect(parsed).to have_key('status')
    expect(parsed['status']).to eq(401)
  end

  it 'can add a favorite location' do
    post "/api/v1/users?email=lance@gmail.com&password=123abc&password_confirmation=123abc"
    user = User.first
    post "/api/v1/favorites?location=Denver,CO&api_key=#{user.api_key}"
    binding.pry
  end
end
