# frozen_string_literal: true

module OpenWeatherMap
  class Timed < Request
    def call
      index = super['list'].find_index do |item|
        item['dt'] > @timestamp
      end

      weather = response['list'][index - 1]

      {
        timestamp: Time.zone.at(weather['dt']),
        weather_description: weather.dig('weather', 0, 'main'),
        temperature: weather.dig('main', 'temp'),
        humidity: weather.dig('main', 'humidity'),
        pressure: weather.dig('main', 'pressure')
      }
    end

    def request_path
      'forecast'
    end
  end
end
