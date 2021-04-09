# frozen_string_literal: true

class Admin::ImageGridComponent < ViewComponent::Base
  def initialize(images:)
    @images = images
  end
end
