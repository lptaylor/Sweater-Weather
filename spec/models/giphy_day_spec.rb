require 'rails_helper'

describe 'giphy_day' do
  before(:each) do
  end
  it 'exists' do
    weather = spy('weather')
    gif = spy('gif')
    day = GiphyDay.new(weather, gif)
    expect(day).to be_a(GiphyDay)
  end

  it 'has attributes' do
    weather = spy('weather')
    gif = spy('gif')
    day = GiphyDay.new(weather, gif)
    day.time
    expect(weather).to_not have_received(:time)
    day.summary
    expect(weather).to have_received(:summary)
    day.url
    expect(gif).to_not have_received(:url)
  end
end
