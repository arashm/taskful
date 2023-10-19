# frozen_string_literal: true

module ClientAuthentication
  extend ActiveSupport::Concern

  class_methods do
    def authenticate_user!(options = {})
      before_action(:authenticate_user!, options)
    end
  end
end
