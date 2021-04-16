# frozen_string_literal: true

class Widgets::MiniPlayerComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end
