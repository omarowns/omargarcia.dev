# frozen_string_literal: true

class Admin::PreviewImageComponent < ViewComponent::Base
  def initialize(image:)
    @image = image
  end

  def render?
    @image.persisted?
  end

  def title
    @image&.title || @image.filename
  end

  def alt
    @image&.alt || @image.filename
  end
end
