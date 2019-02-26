class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    user.save
    render json: {api_key: user.api_key, status: 201}
  end

private
  def user_params
    gen_api
    params.permit('email', 'password', 'api_key')
  end

  def gen_api
    params['api_key'] = Digest::MD5.hexdigest(params['email'])
  end
end
