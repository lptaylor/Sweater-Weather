require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe 'instance_methods' do
    it 'has attributes' do
      forecast = Forecast.new("denver, co")
      expect(forecast.city).to eq('denver')
      expect(forecast.state).to eq('co')
      expect(forecast.date).to eq(Time.now.strftime('%Y-%m-%d'))
    end
    it "get_lat", :vcr do
      forecast = Forecast.new("denver, co")
      expect(forecast.get_lat).to eq(39.7392358)
    end
    it "get_lon", :vcr do
      forecast = Forecast.new("denver, co")
      expect(forecast.get_lon).to eq(-104.990251)
    end
    it "current_weather", :vcr do
      forecast = Forecast.new("denver, co")
      expect(forecast.current_weather).to be_a(CurrentWeather)
    end
    it "hourly_weather", :vcr do
      forecast = Forecast.new("denver, co")
      expect(forecast.hourly_weather).to be_a(Array)
      expect(forecast.hourly_weather.length).to eq(8)
      expect(forecast.hourly_weather[0]).to be_a(Weather)
    end
    it "daily_weather", :vcr do
      forecast = Forecast.new("denver, co")
      expect(forecast.daily_weather).to be_a(Array)
      expect(forecast.daily_weather.length).to eq(5)
      expect(forecast.daily_weather[0]).to be_a(WeatherDay)
    end
  end
end
