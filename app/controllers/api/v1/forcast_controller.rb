class Api::V1::ForecastController < AppliationController
  def index
    forecast = Forecast.new(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
