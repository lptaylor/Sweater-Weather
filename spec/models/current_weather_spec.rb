require 'rails_helper'

describe 'Current Weather' do
  it 'exists' do
    temp = 38.15
    feels_like_temp = 40.15
    humidity = 0.75
    uv_index = 2
    visibility = 8.2
    summary = 'sunny'
    icon = 'partly-cloudy-night'
    current_weather_data = {:temperature => temp,
                            :apparentTemperature => feels_like_temp,
                            :humidity => humidity,
                            :uvIndex => uv_index,
                            :visibility => visibility,
                            :summary => summary,
                            :icon => icon}
    c_weather = CurrentWeather.new(current_weather_data)

    expect(c_weather).to be_a(CurrentWeather)
  end
end
