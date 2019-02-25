class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :date, :city, :state

  attribute :current_weather do |object|
    object.current_weather
  end

  attribute :hourly_weather do |object|
    object.hourly_weather
  end

  attribute :days_weather do |object|
    object.daily_weather
  end
end
