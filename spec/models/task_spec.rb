# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task do
  describe 'store_weather' do
    let(:user) do
      User.create(country: 'IE', city: 'Dublin', email: 'test@example.com', password_confirmation: 'password',
                  password: 'password')
    end

    let(:params) do
      {
        title: 'Task 1',
        description: 'Task 1 description',
        due_date: 2.days.from_now
      }
    end

    it 'stores weather after task is created' do
      stub_request(:get, 'https://api.openweathermap.org/data/2.5/forecast?appid=123&lat=53.3493795&lon=-6.2605593&units=metric')
        .to_return(status: 200, body: File.read('spec/fixtures/open_weather_map/forecast.json'))

      stub_request(:get, 'https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=IE,%20Dublin')
        .to_return(status: 200, body: File.read('spec/fixtures/open_street_map/search.json'), headers: {})

      expect { user.tasks.create(params) }.to change { Weather.count }.by(1)
    end
  end
end
