require 'rails_helper'

describe 'background' do
  it 'exists' do
    background = Background.new(flickr_stub)

    expect(background).to be_a(Background)
  end

  it 'returns a url' do
    background = Background.new(flickr_stub)
    url = background.build_url

    expect(url).to eq('https://farm1.staticflickr.com/926/42383111334_1cdd356459.jpg')
  end
end
