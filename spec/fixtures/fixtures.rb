def flickr_fixture
  {:id=>"42383111334",
 :owner=>"132341834@N05",
 :secret=>"1cdd356459",
 :server=>"926",
 :farm=>1,
 :title=>"Sunset shot from last week",
 :ispublic=>1,
 :isfriend=>0,
 :isfamily=>0}
end

def hourly_weather_fixture
  {:hourly => {data: [
          {
              :time => 1551088800,
              :icon => "partly-cloudy-night",
              :temperature => 51.67,
          },
          {
              :time => 1551092400,
              :icon => "partly-cloudy-night",
              :temperature => 51.23,
          },
          {
              :time => 1551096000,
              :icon => "partly-cloudy-night",
              :temperature => 0.82,
          },
          {
              :time => 1551088800,
              :icon => "partly-cloudy-night",
              :temperature => 51.67,
          },
          {
              :time => 1551092400,
              :icon => "partly-cloudy-night",
              :temperature => 51.23,
          },
          {
              :time => 1551096000,
              :icon => "partly-cloudy-night",
              :temperature => 0.82,
          },
          {
              :time => 1551088800,
              :icon => "partly-cloudy-night",
              :temperature => 51.67,
          },
          {
              :time => 1551092400,
              :icon => "partly-cloudy-night",
              :temperature => 51.23,
          },
          {
              :time => 1551096000,
              :icon => "partly-cloudy-night",
              :temperature => 0.82,
          }]}}
end

def daily_weather_fixture
  {:daily => {data:
              [{
    :time => 1551081600,
    :icon => "rain",
    :precipProbability => 1,
    :precipType => "rain",
    :temperatureHigh => 53.03,
    :temperatureLow => 53.36,
              },
              {
    :time => 1551081600,
    :icon => "rain",
    :precipProbability => 1,
    :precipType => "rain",
    :temperatureHigh => 53.03,
    :temperatureLow => 53.36,
              },
              {
    :time => 1551081600,
    :icon => "rain",
    :precipProbability => 1,
    :precipType => "rain",
    :temperatureHigh => 53.03,
    :temperatureLow => 53.36,
              },
              {
    :time => 1551081600,
    :icon => "rain",
    :precipProbability => 1,
    :precipType => "rain",
    :temperatureHigh => 53.03,
    :temperatureLow => 53.36,
              },
              {
    :time => 1551081600,
    :icon => "rain",
    :precipProbability => 1,
    :precipType => "rain",
    :temperatureHigh => 53.03,
    :temperatureLow => 53.36,
      }]}}
end
