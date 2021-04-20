# frozen_string_literal: true

class Admin::ImageComponent < ViewComponent::Base
  def initialize(image:)
    @image = image
  end
end
