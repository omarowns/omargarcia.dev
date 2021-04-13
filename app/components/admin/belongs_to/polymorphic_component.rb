# frozen_string_literal: true

class Admin::BelongsTo::PolymorphicComponent < ViewComponent::Base
  def initialize(form:, references:)
    @form = form
    @references = references
  end

  def hidden?
    @form&.object&.public_send(@references).present?
  end
end
