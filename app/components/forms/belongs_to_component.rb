# frozen_string_literal: true

class Forms::BelongsToComponent < ViewComponent::Base

  def initialize(form:, model:, attribute:, select_model:, select_attrs:, force: false, params: {})
    @form = form
    @model = model
    @attribute = attribute
    @select_model = select_model
    @select_attrs = select_attrs
    @force = force
    @params = params
  end

  def render?
    @model.public_send(@attribute).blank? || @force
  end

  def has_param?(key)
    fetch_param(key).present?
  end

  def fetch_param(key)
    @params[key.to_s]
  end
end
