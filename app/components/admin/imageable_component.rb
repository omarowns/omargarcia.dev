# frozen_string_literal: true

class Admin::ImageableComponent < ViewComponent::Base
  def initialize(form:)
    @form = form
  end
end
