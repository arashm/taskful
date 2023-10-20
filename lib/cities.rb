# frozen_string_literal: true

class Cities
  include Enumerable

  attr_reader :cities

  def initialize
    @cities = JSON.parse(Rails.root.join('lib/cities.json').read)
  end

  def each(&)
    @cities.each(&)
  end
end
