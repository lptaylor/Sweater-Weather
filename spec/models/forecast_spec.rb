require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe 'instance_methods' do
    it 'has attributes' do
      forecast = Forecast.new("denver, co")
      expect(forecast.city).to eq('denver')
      expect(forecast.state).to eq('co')
      expect(forecast.date).to eq(Time.now.strftime('%Y-%m-%d'))
    end
  end
end
