class Api::V1::GifsController < ApplicationController
  def index
    if cache_empty?
      gifs = GiphyDaysWeatherPresenter.new(params['location'])
      render json: GifsSerializer.new(gifs)
      cache_result(:gifs, GifsSerializer.new(gifs))
    else
      render json: read_cache
    end
  end
end

private

def cache_result(gifs, serializer)
  Rails.cache.write(gifs, serializer, expires_in: 1.day)
end

def cache_empty?
  Rails.cache.read(:gifs).nil?
end

def read_cache
  Rails.cache.read(:gifs)
end
