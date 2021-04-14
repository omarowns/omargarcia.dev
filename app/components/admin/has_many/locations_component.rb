# frozen_string_literal: true

class Admin::HasMany::LocationsComponent < ViewComponent::Base
  def initialize(model:)
    @model = model
  end

  def location_proxies
    @location_proxies ||= @model&.location_proxies&.order(position: :asc) || []
  end
end
