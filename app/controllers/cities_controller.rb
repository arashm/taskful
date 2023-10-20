# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @cities = CS.states(index_params[:country_code])
                .keys
                .flat_map { |state| CS.cities(state, index_params[:country_code]) }
                .sort

    render json: { options: helpers.options_for_cities_select(@cities) }
  end

  private

  def index_params
    params.permit(:country_code)
  end
end
