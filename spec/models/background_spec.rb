require 'rails_helper'

describe 'background' do
  it 'exists' do
    background = Background.new(flickr_stub)

    expect(background).to be_a(Background)
  end
end
