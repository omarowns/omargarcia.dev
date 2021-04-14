# frozen_string_literal: true

class Auth::ArticleComponent < ViewComponent::Base
  include ViewComponent::SlotableV2

  renders_one :header
  renders_one :section
  renders_one :footer

  class HeaderComponent < ViewComponent::Base; end
  class SectionComponent < ViewComponent::Base; end
  class FooterComponent < ViewComponent::Base; end
end
