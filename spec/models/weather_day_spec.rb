require 'rails_helper'

describe 'weather_day' do
  before(:each) do
            @data = {
                :time => 1551081600,
                :icon => "rain",
                :precipProbability => 1,
                :precipType => "rain",
                :temperatureHigh => 53.03,
                :temperatureLow => 53.36,
                  }
    @w_day = WeatherDay.new(@data)
  end
  it 'exists' do
    expect(@w_day).to be_a(WeatherDay)
  end
  it 'has attributes' do
    expect(@w_day.day).to eq(1551081600)
    expect(@w_day.icon).to eq("rain")
    expect(@w_day.precipitaion_chance).to eq(1)
    expect(@w_day.precipitaion_type).to eq("rain")
    expect(@w_day.high_temp).to eq(53.03)
    expect(@w_day.low_temp).to eq(53.36)
  end
end
