# frozen_string_literal: true

class Spotify::PlayerComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
