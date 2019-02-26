require 'rails_helper'

describe 'favorite' do
  it 'exists' do
    user = User.create(email: 'timmy@gmail.com', password: 'abc123', api_key: '12345')
    favorite_loc = FavoriteLocation.new(location: "Denver, CO", user_id: user.id)

    expect(favorite_loc).to be_a(FavoriteLocation)
    expect(favorite_loc.location).to eq('Denver, CO')
    expect(favorite_loc.user_id).to eq(user.id)
  end
end
