# frozen_string_literal: true

module PageTitle
  extend ActiveSupport::Concern

  class_methods do
    def set_page_title(title = nil)
      before_action(if: -> { request.format.html? }) do
        page_title(title)
      end
    end
  end

  protected

  def page_title(title)
    @page_title = title || controller_name.titleize
  end
end
