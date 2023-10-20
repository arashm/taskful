# frozen_string_literal: true

class Countries
  include Enumerable

  attr_reader :countries

  def initialize
    @countries = JSON.parse(Rails.root.join('lib/countries.json').read)
  end

  def each(&)
    @countries.each(&)
  end
end
