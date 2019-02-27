require 'rails_helper'

describe 'hourly_weather' do
  before(:each) do
    @h_weather = HourlyWeather.make_hourly_array(hourly_weather_fixture)
  end
  it 'exists' do
    expect(@h_weather[0]).to be_a(Weather)
  end
  it 'is an array size eight' do
    expect(@h_weather.length).to eq(8)
  end
  it 'each object has attributes' do
    expect(@h_weather[0].time).to eq(1551088800)
    expect(@h_weather[0].icon).to eq("partly-cloudy-night")
    expect(@h_weather[0].temperature).to eq(51.67)
  end
end
