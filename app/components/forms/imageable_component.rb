# frozen_string_literal: true

class Forms::ImageableComponent < ViewComponent::Base
  def initialize(form:)
    @form = form
  end
end
