# frozen_string_literal: true

class Admin::TableComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_one :new_link

  def initialize(records:)
    @records = records
    @attributes = @records&.first&.attribute_names - %w(id created_at updated_at) || []
  end

  class NewLinkComponent < ViewComponent::Base; end
end
