# frozen_string_literal: true

class Widgets::TweetsComponent < ViewComponent::Base
  def initialize(tweets:)
    @tweets = tweets
  end

  def render?
    @tweets.compact.any?
  end
end
