require 'rails_helper'

describe 'giphy_days_weather' do
  before(:each) do
    @day = GiphyDaysWeather.new(weather_data)
  end
  it 'exists' do
    expect(@day).to be_a(GiphyDaysWeather)
  end
  it 'has attributes' do
    expect(@day.time).to eq(@time)
    expect(@day.url).to eq(@url)
    expect(@day.summary).to eq(@summary)
  end
end
