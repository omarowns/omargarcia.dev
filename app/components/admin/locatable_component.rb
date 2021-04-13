# frozen_string_literal: true

class Admin::LocatableComponent < ViewComponent::Base
  def initialize(form:)
    @form = form
  end
end
