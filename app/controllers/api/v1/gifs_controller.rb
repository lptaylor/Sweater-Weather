class Api::V1::GifsController < ApplicationController
  def index
    if (cache_empty? || params['location'] != check_location)
      gifs = GiphyDaysWeatherPresenter.new(params['location'])
      render json: GifsSerializer.new(gifs)
      cache_result(:gifs, GifsSerializer.new(gifs))
      cache_location(:gif_location, params['location'])
    else
      render json: read_gifs_cache
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

def read_gifs_cache
  Rails.cache.read(:gifs)
end

def cache_location(gif_location, location)
  Rails.cache.write(gif_location, location, expires_in: 1.day)
end

def check_location
  Rails.cache.read(:gif_location)
end
