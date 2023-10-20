# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OpenWeatherMap::Timed do
  describe '#call' do
    subject(:call) { described_class.new(lat: 0, lon: 0, timestamp: timestamp).call }

    let(:timestamp) { Time.zone.now.to_i }

    it 'returns a hash with weather data' do
      stub_request(:get, 'https://api.openweathermap.org/data/2.5/forecast?appid=123&lat=0&lon=0&units=metric')
        .to_return(status: 200, body: File.read('spec/fixtures/open_weather_map/forecast.json'))
      expect(call).to be_a(Hash)
      expect(call).to include(:timestamp, :weather_description, :temperature, :humidity, :pressure)
    end

    it 'raises an error when the response is not 200' do
      stub_request(:get, 'https://api.openweathermap.org/data/2.5/forecast?appid=123&lat=0&lon=0&units=metric')
        .to_return(status: 404)

      expect { call }.to raise_error(OpenWeatherMap::Error)
    end
  end
end
