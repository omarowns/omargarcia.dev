# frozen_string_literal: true

class FlashMessageComponent < ViewComponent::Base
  def initialize(flash:)
    @flash = flash
  end

  def render?
    notice.present? || alert.present?
  end

  def notice
    flash.notice
  end

  def alert
    flash.alert
  end
end
