# frozen_string_literal: true

class Admin::ActionText::AttachableComponent < ViewComponent::Base
  def initialize(object:, collection:)
    @object = object
    @collection = collection
  end

  def attachment_class_name
    @attachment_class_name ||= @collection.first&.class&.to_s&.capitalize
  end
end
