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
end
