# frozen_string_literal: true

class Admin::ImageProxyComponent < ViewComponent::Base
  def initialize(record:)
    @record = record
  end

end
