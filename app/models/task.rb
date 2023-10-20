# frozen_string_literal: true

class Task < ApplicationRecord
  after_create :store_weather

  belongs_to :user
  has_one :weather, dependent: :destroy

  validates :title, :description, presence: true
  validates_comparison_of :due_date, greater_than_or_equal_to: -> { Time.zone.now }, allow_blank: true

  enum status: { pending: 'p', completed: 'c' }

  private

  def current_weather
    @current_weather ||= OpenWeatherMap::Api.request(lat: user.lat_long[0], lon: user.lat_long[1],
                                                     timestamp: due_date.to_i).call
  end

  # TODO: move to background job processor
  def store_weather
    return unless due_date.present? && due_date < 5.days.from_now

    create_weather(**current_weather.slice(:weather_description, :temperature, :humidity, :pressure))
  rescue OpenWeatherMap::Error
    Rails.logger.error("Error while fetching weather for task #{id}")
  end
end
