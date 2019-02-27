require 'rails_helper'

describe 'giphy_day' do
  it 'exists' do
    weather = spy('weather')
    gif = spy('gif')
    day = GiphyDay.new(weather, gif)
    expect(day).to be_a(GiphyDay)
  end

  it 'has attributes' do
    weather_data= {
                  time: day = double('day'),
                  summary: summary = double('summary')
                  }
    gif = double('gif')
    weather = WeatherDay.new(weather_data)
    day_object = GiphyDay.new(weather, gif)
    expect(day_object.time).to eq(day)
    expect(day_object.summary).to eq(summary)
    expect(day_object.url).to eq(gif)
  end
end
