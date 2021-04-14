# frozen_string_literal: true

class Forms::LocatableComponent < ViewComponent::Base
  def initialize(form:)
    @form = form
  end
end
