# frozen_string_literal: true

class ImageComponent < ViewComponent::Base
  def initialize(image:, **attrs)
    @image = image
    @attrs = attrs
  end

  def render?
    @image.present?
  end
end
