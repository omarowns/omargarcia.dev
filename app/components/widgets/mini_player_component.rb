# frozen_string_literal: true

class Widgets::MiniPlayerComponent < ViewComponent::Base
  def initialize(track:)
    @track = track
  end
end