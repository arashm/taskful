# frozen_string_literal: true

class Task < ApplicationRecord
  after_create :create_weather

  belongs_to :user
  has_one :weather, dependent: :destroy

  validates :title, :description, presence: true
  validates_comparison_of :due_date, greater_than_or_equal_to: -> { Time.zone.now }, allow_blank: true

  enum status: { pending: 'p', completed: 'c' }

  private

  # TODO: move to background job processor
  def create_weather
    return unless task.due_date && task.due_date < 5.days.from_now

    response = OpenWeatherMap::Api.request(lat: user.lat, lon: user.lon, timestamp: due_date.to_i).call
    weather.create(**response.slice(:weather_description, :temperature, :humidity, :pressure))
  rescue OpenWeatherMap::Error
    Rails.logger.error("Error while fetching weather for task #{id}")
  end
end
