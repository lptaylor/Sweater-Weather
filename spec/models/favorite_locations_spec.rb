require 'rails_helper'

RSpec.describe FavoriteLocation, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should have_many :user_favorite_locations }
    it { should have_many(:users).through(:user_favorite_locations) }
  end
end
