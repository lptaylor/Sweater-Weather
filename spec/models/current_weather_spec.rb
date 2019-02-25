require 'rails_helper'

describe 'Current Weather' do
  before(:each) do
    @temp = 38.15
    @feels_like_temp = 40.15
    @humidity = 0.75
    @uv_index = 2
    @visibility = 8.2
    @summary = 'sunny'
    @icon = 'partly-cloudy-night'
    @current_weather_data = {:currently => {:temperature => @temp,
                            :apparentTemperature => @feels_like_temp,
                            :humidity => @humidity,
                            :uvIndex => @uv_index,
                            :visibility => @visibility,
                            :summary => @summary,
                            :icon => @icon}}
  end
  it 'exists' do
    c_weather = CurrentWeather.new(@current_weather_data)

    expect(c_weather).to be_a(CurrentWeather)
  end

  it 'has attributes' do
    c_weather = CurrentWeather.new(@current_weather_data)

    expect(c_weather.temperature).to eq(@temp)
    expect(c_weather.feels_like_temp).to eq(@feels_like_temp)
    expect(c_weather.humidity).to eq(@humidity)
    expect(c_weather.uv_index).to eq(@uv_index)
    expect(c_weather.visibility).to eq(@visibility)
    expect(c_weather.summary).to eq(@summary)
    expect(c_weather.icon).to eq(@icon)
  end
end
