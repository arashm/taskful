# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  validates :title, :description, presence: true
  validates_comparison_of :due_date, greater_than_or_equal_to: -> { Time.zone.now }, allow_blank: true
end
