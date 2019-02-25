require 'rails_helper'

describe 'hourly_weather' do
  before(:each) do
    @hourly_weather_data = :data [
            {
                :time => 1551088800,
                :icon => "partly-cloudy-night",
                :temperature => 51.67,
            },
            {
                :time => 1551092400,
                :icon => "partly-cloudy-night",
                :temperature => 51.23,
            },
            {
                :time => 1551096000,
                :icon => "partly-cloudy-night",
                :temperature => 0.82,
            },
            {
                :time => 1551088800,
                :icon => "partly-cloudy-night",
                :temperature => 51.67,
            },
            {
                :time => 1551092400,
                :icon => "partly-cloudy-night",
                :temperature => 51.23,
            },
            {
                :time => 1551096000,
                :icon => "partly-cloudy-night",
                :temperature => 0.82,
            },
            {
                :time => 1551088800,
                :icon => "partly-cloudy-night",
                :temperature => 51.67,
            },
            {
                :time => 1551092400,
                :icon => "partly-cloudy-night",
                :temperature => 51.23,
            },
            {
                :time => 1551096000,
                :icon => "partly-cloudy-night",
                :temperature => 0.82,
            }]
  @h_weather = HourlyWeather.new(@hourly_weather_data)

  end
  it 'exists' do
    expect(@h_weather[0]).to be_a(HourlyWeather)
  end
  it 'is an array size eight' do
    expect(@h_weather.length).to eq(8)
  end
  it 'each object has attributes' do
    expect(@h_weather[0].time).to eq(1551088800)
    expect(@h_weather[0].temperature).to eq("partly-cloudy-night")
    expect(@h_weather[0].icon).to eq(51.67)
  end
end
