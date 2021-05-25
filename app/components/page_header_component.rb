# frozen_string_literal: true

class PageHeaderComponent < ViewComponent::Base
  def initialize(title:, subtitle:, extra_line:)
    @title = title
    @subtitle = subtitle
    @extra_line = extra_line
  end

end
