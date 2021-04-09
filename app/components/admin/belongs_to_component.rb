# frozen_string_literal: true

class Admin::BelongsToComponent < ViewComponent::Base

  def initialize(form:, model:, attribute:, select_model:, select_attrs:, force: false)
    @form = form
    @model = model
    @attribute = attribute
    @select_model = select_model
    @select_attrs = select_attrs
    @force = force
  end

  def render?
    @model.public_send(@attribute).blank? || @force
  end
end
