# frozen_string_literal: true

class Widgets::MiniPlayerComponent < ViewComponent::Base
  def initialize(player:)
    @player = player
  end

  def render?
    @player.present?
  end
end
