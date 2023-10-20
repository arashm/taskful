# frozen_string_literal: true

module ApplicationHelper
  def options_for_cities_select(collection)
    options = "<option value=''>Select a City</option>"
    collection.each { |item| options += "<option value='#{item}'>#{item}</option>" }

    options.html_safe
  end
end
