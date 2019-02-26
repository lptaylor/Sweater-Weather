require 'rails_helper'

describe 'giphy_day' do
  before(:each) do
    @data =  {"data":{"id":"70238172686800","type":"forecast","attributes":{"date":"2019-02-25","city":"denver","state":"co","current_weather":{"temperature":31.44,"feels_like_temp":27.49,"humidity":0.63,"uv_index":2,"visibility":10,"summary":"Mostly Cloudy","icon":"partly-cloudy-day"},"hourly_weather":[{"time":1551110400,"icon":"partly-cloudy-day","temperature":25.56},{"time":1551114000,"icon":"partly-cloudy-day","temperature":32.25},{"time":1551117600,"icon":"partly-cloudy-day","temperature":37.76},{"time":1551121200,"icon":"partly-cloudy-day","temperature":42.77},{"time":1551124800,"icon":"partly-cloudy-day","temperature":47.05},{"time":1551128400,"icon":"partly-cloudy-day","temperature":49.37},{"time":1551132000,"icon":"partly-cloudy-day","temperature":50.69},{"time":1551135600,"icon":"partly-cloudy-day","temperature":50.5}],"days_weather":[{"day":1551078000,"icon":"partly-cloudy-day","precipitaion_chance":0.05,"precipitaion_type":"snow","high_temp":50.69,"low_temp":23.77},{"day":1551164400,"icon":"partly-cloudy-day","precipitaion_chance":0.04,"precipitaion_type":"rain","high_temp":54.41,"low_temp":26.53},{"day":1551250800,"icon":"partly-cloudy-day","precipitaion_chance":0.04,"precipitaion_type":"snow","high_temp":52.43,"low_temp":28.35},{"day":1551337200,"icon":"partly-cloudy-day","precipitaion_chance":0.04,"precipitaion_type":"rain","high_temp":52.84,"low_temp":28.25},{"day":1551423600,"icon":"partly-cloudy-day","precipitaion_chance":0.08,"precipitaion_type":"snow","high_temp":38.09,"low_temp":20.91}]}}}
    @day = GiphyDay.new(@data[:data][:attributes][:days_weather][0])
  end
  it 'exists' do
    expect(@day).to be_a(GiphyDay)
  end

  it 'has attributes' do
    expect(@day.time).to eq(@data[:data][:attributes][:days_weather][0][:time])
    expect(@day.url).to eq(@data[:data][:attributes][:days_weather][0][:url])
    expect(@day.summary).to eq(@data[:data][:attributes][:days_weather][0][:summary])
  end
end
