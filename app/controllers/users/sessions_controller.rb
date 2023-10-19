# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # GET /resource/sign_in
    def new
      page_title('Sign In')

      super
    end
  end
end
