# frozen_string_literal: true

class Admin::TableComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_one :new_link

  def initialize(records:, model:)
    @records = records || []
    @model = model
  end

  def attributes
    @attributes ||= @model.column_names - belongs_to_columns - %w(id created_at updated_at) || []
  end

  def belongs_to_columns
    @belongs_to_columns ||= belongs_to_associations.map { |model_name| "#{model_name}_id" }
  end

  def belongs_to_associations
    @belongs_to_associations ||= @model.reflect_on_all_associations(:belongs_to).map(&:name)
  end

  class NewLinkComponent < ViewComponent::Base; end
end
