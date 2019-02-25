class Api::V1::GifsController < ApplicationController
  def index
    gifs = get "/api/v1/forcast?location=#{params[:location]}"
    render json: GiphySerializer.new(gifs)
  end
end
