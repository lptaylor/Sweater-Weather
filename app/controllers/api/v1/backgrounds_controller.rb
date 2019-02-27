class Api::V1::BackgroundsController < ApplicationController
  def show
    if cache_empty?
      background = BackgroundFacade.new(params['location'])
      render json: BackgroundSerializer.new(background)
      cache_result(:image, BackgroundSerializer.new(background))
    else
      render json: read_cache
    end
  end
end

private

def cache_result(image, serializer)
  Rails.cache.write(image, serializer, expires_in: 86400)
end

def cache_empty?
  Rails.cache.read(:image).nil?
end

def read_cache
  Rails.cache.read(:image)
end
