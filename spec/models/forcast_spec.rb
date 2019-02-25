require 'rails_helper'

describe 'forcast' do
  before(:each) do
    @data = {:daily => {data:
                [{
      :time => 1551081600,
      :icon => "rain",
      :precipProbability => 1,
      :precipType => "rain",
      :temperatureHigh => 53.03,
      :temperatureLow => 53.36,
                },
                {
      :time => 1551081600,
      :icon => "rain",
      :precipProbability => 1,
      :precipType => "rain",
      :temperatureHigh => 53.03,
      :temperatureLow => 53.36,
                },
                {
      :time => 1551081600,
      :icon => "rain",
      :precipProbability => 1,
      :precipType => "rain",
      :temperatureHigh => 53.03,
      :temperatureLow => 53.36,
                },
                {
      :time => 1551081600,
      :icon => "rain",
      :precipProbability => 1,
      :precipType => "rain",
      :temperatureHigh => 53.03,
      :temperatureLow => 53.36,
                },
                {
      :time => 1551081600,
      :icon => "rain",
      :precipProbability => 1,
      :precipType => "rain",
      :temperatureHigh => 53.03,
      :temperatureLow => 53.36,
        }]}}
    @forcast = Forcast.make_forcast_array(@data)
  end
  it 'exists' do
    expect(@forcast).to be_a(Array)
  end
  it 'is an array of days objects length 5' do
    expect(@forcast.length).to eq(5)
    expect(@forcast[0]).to be_a(WeatherDay)
  end
end
