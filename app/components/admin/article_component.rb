# frozen_string_literal: true

class Admin::ArticleComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_one :header
  renders_one :section
  renders_one :footer
end
