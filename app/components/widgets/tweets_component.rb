# frozen_string_literal: true

class Widgets::TweetsComponent < ViewComponent::Base
  def initialize(tweets:)
    @tweets = tweets
  end

end
