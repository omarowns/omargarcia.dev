# frozen_string_literal: true

class Spotify::PlayerComponent < ViewComponent::Base
  def initialize(track:)
    @track = track
  end

end
