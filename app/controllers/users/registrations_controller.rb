# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    before_action :set_countries, only: %i[new create]

    # GET /resource/sign_up
    def new
      page_title('Sign Up')

      super
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[country city])
    end

    def set_countries
      @countries = Countries.new.map { |key, value| [value, key] }
    end
  end
end
