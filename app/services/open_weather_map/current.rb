# frozen_string_literal: true

module OpenWeatherMap
  class Current < Request
    def call
      response = super

      {
        timestamp: Time.zone.at(response['dt']),
        weather_description: response.dig('weather', 0, 'description'),
        temperature: response.dig('main', 'temp'),
        humidity: response.dig('main', 'humidity'),
        pressure: response.dig('main', 'pressure')
      }
    end

    def request_path
      'weather'
    end
  end
end
