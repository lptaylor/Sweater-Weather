require 'rails_helper'

describe 'giphy_days_weather' do
  it 'exists', :vcr do
    location = 'denver,co'
    days = GiphyDaysWeatherPresenter.new(location)
    expect(days).to be_a(GiphyDaysWeatherPresenter)
  end
  
  it 'returns a list of gif urls', :vcr do
    location = 'denver,co'
    days = GiphyDaysWeatherPresenter.new(location)
    expect(days.fetch_giphy_gifs.count).to eq(5)
  end
end
