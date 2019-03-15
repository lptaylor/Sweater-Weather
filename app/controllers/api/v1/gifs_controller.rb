class Api::V1::GifsController < ApplicationController
  def index
      gifs = GiphyDaysWeatherPresenter.new(params['location'])
      render json: GifsSerializer.new(gifs)
  end
end
