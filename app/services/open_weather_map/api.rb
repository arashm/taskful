# frozen_string_literal: true

module OpenWeatherMap
  class Api
    def self.request(lat:, lon:, timestamp: nil)
      return Current.new(lat:, lon:) if timestamp.nil?

      Timed.new(lat:, lon:, timestamp:)
    end
  end
end
