class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params['api_key'])
    if !user.nil?
      render json: FavoritesSerializer.new(user.favorite_locations)
    else
      render json: {status: 401}
    end
  end

  def create
    user = User.find_by(api_key: params['api_key'])
      if !user.nil?
        user.favorite_locations.create(location_params)
        render json: {status: 201}
      else
        render json: {status: 401}
      end
  end

  def destroy
    user = User.find_by(api_key: params['api_key'])
    if !user.nil?
      location = user.favorite_locations.find_by(location: params['location'])
      location.destroy
      render json: FavoritesSerializer.new(location)
    else
      render json: {status: 401}
    end
  end
end

private

  def location_params
    params.permit('location')
  end
