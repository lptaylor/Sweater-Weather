class Api::V1::BackgroundsController < ApplicationController
  def show
    if (cache_empty? || params['location'] != check_location)
      background = BackgroundFacade.new(params['location'])
      render json: BackgroundSerializer.new(background)
      cache_result(:background, BackgroundSerializer.new(background))
    else
      render json: read_cache
    end
  end
end

private

def cache_result(background, serializer)
  Rails.cache.write(background, serializer, expires_in: 1.day)
end

def cache_empty?
  Rails.cache.read(:background).nil?
end

def read_cache
  Rails.cache.read(:background)
end

def check_location
  data_json = read_cache.to_json
  parsed = JSON.parse(data_json, symbolize_names: true)
  parsed[:data][:attributes][:location]
end
