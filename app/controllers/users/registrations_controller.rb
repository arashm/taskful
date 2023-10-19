# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # GET /resource/sign_up
    def new
      page_title('Sign Up')

      super
    end
  end
end
