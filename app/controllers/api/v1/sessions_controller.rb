class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find(params[:email])
      if user && user.authenticate(params[:password])
        render json: {api_key: user.api_key, status: 200}
      else
        render json: {status: 401}
      end
  end
end
