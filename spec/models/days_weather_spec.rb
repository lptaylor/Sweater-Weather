require 'rails_helper'

describe 'days weather' do
  before(:each) do
    @forecast = DaysWeather.make_forecast_array(daily_weather_fixture)
  end
  it 'exists' do
    expect(@forecast).to be_a(Array)
  end
  it 'is an array of days objects length 5' do
    expect(@forecast.length).to eq(5)
    expect(@forecast[0]).to be_a(WeatherDay)
  end
end
