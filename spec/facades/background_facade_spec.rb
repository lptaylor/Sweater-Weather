require 'rails_helper'

describe 'background facade' do
  it 'can get lat from google', :vcr do
    background = BackgroundFacade.new('denver,co')
    expect(background.get_lat).to eq(39.7392358)
  end
  it 'can get lon from google', :vcr do
    background = BackgroundFacade.new('denver,co')
    expect(background.get_lon).to eq(-104.990251)
  end
  it 'can make a background from data', :vcr do
    background = BackgroundFacade.new('denver,co')
    expect(background.make_background).to be_a(Background)
  end
end
