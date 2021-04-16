# frozen_string_literal: true

class SessionLinksComponent < ViewComponent::Base
  def initialize(current_user:)
    @current_user = current_user
  end

  def render?
    @current_user.present?
  end
end
