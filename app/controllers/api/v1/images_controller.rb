class Api::V1::ImagesController < ApplicationController
  def index
    five_day_forecast = Forecast.new(params['forecast']).daily_weather
    gifs = GiphyDaysWeather.new(five_day_forecast).fetch_giphy_gifs
    render json: ImagesSerializer.new(gifs)
  end
end
