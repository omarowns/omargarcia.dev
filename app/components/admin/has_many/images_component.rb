# frozen_string_literal: true

class Admin::HasMany::ImagesComponent < ViewComponent::Base
  def initialize(model:)
    @model = model
  end

  def image_proxies
    @image_proxies ||= @model&.image_proxies&.order(position: :asc) || []
  end
end
