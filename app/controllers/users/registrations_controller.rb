# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    # GET /resource/sign_up
    def new
      page_title('Sign Up')
      @countries = CS.countries.map { |key, value| [value, key] }

      super
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[country city])
    end
  end
end
