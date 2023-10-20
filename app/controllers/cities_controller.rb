# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @cities = Cities.new.cities[index_params[:country_code]]

    render json: { options: helpers.options_for_cities_select(@cities) }
  end

  private

  def index_params
    params.permit(:country_code)
  end
end
