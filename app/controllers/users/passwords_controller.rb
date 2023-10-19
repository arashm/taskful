# frozen_string_literal: true

module Users
  class PasswordsController < Devise::PasswordsController
    # GET /resource/password/new
    def new
      page_title('Reset Password')

      super
    end

    # GET /resource/password/edit?reset_password_token=abcdef
    def edit
      page_title('Edit Your Password')

      super
    end
  end
end
