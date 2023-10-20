# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OpenWeatherMap::Current do
  describe '#url' do
    it 'returns the correct url' do
      url = described_class.new(lat: 1, lon: 2).url

      expect(url).to eq('https://api.openweathermap.org/data/2.5/weather?appid=123&lat=1&lon=2&units=metric')
    end
  end

  describe '#call' do
    let(:timestamp) { 1.day.from_now.to_i }

    it 'returns the correct response' do
      stub_request(:get, 'https://api.openweathermap.org/data/2.5/weather?appid=123&lat=1&lon=2&units=metric')
        .to_return(status: 200, body: { dt: timestamp, weather: [{ description: 'clear sky' }],
                                        main: { temp: 10, humidity: 60, pressure: 1013 } }.to_json)

      response = described_class.new(lat: 1, lon: 2).call

      expect(response).to eq(weather_description: 'clear sky', temperature: 10, humidity: 60, pressure: 1013,
                             timestamp: Time.zone.at(timestamp))
    end

    it 'raises an error when the response is not 200' do
      stub_request(:get, 'https://api.openweathermap.org/data/2.5/weather?appid=123&lat=1&lon=2&units=metric')
        .to_return(status: 404)

      expect { described_class.new(lat: 1, lon: 2).call }.to raise_error(OpenWeatherMap::Error)
    end
  end
end
