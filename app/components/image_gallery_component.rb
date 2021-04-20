# frozen_string_literal: true

class ImageGalleryComponent < ViewComponent::Base
  def initialize(images:)
    @images = images
  end

  def render?
    @images.any? && @images.size == 4 # hardcoding this for now
  end
end
