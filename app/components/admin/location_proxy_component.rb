# frozen_string_literal: true

class Admin::LocationProxyComponent < ViewComponent::Base
  def initialize(record:)
    @record = record
  end

end
