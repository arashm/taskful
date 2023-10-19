# frozen_string_literal: true

module OpenWeatherMap
  class Request
    BASE_URL = 'api.openweathermap.org'
    PATH = '/data/2.5/'
    UNIT = 'metric'

    def initialize(lat:, lon:, timestamp: nil)
      @lat = lat
      @lon = lon
      @timestamp = timestamp
    end

    def call
      response = HTTPX.get(url)
      JSON.parse(response.to_s)
    rescue HTTPX::Error
      raise OpenWeatherMap::Error
    end

    def query_params
      {
        appid: api_key,
        lat: @lat,
        lon: @lon,
        units: UNIT
      }
    end

    def url
      URI::HTTPS.build(host: BASE_URL, path: path, query: query_params.to_query).to_s
    end

    def api_key
      @api_key ||= Rails.application.credentials.open_weather_map[:api_key]
    end

    def path
      "#{PATH}#{request_path}"
    end

    def request_path
      raise NotImplementedError
    end
  end
end
