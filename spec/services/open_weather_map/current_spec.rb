# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OpenWeatherMap::Current do
  describe '#url' do
    it 'returns the correct url' do
      url = described_class.new(lat: 1, lon: 2).url

      expect(url).to eq('http://api.openweathermap.org/data/3/onecall?appid=123&lat=1&lon=2&units=metric')
    end
  end
end
