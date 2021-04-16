# frozen_string_literal: true

class TweetComponent < ViewComponent::Base
  def initialize(tweet:)
    @tweet = tweet
  end

  def tweet_text
    @tweet[:text]
  end

  def tweet_created_at
    @tweet[:created_at]
  end
end
