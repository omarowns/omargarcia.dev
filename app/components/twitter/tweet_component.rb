# frozen_string_literal: true

class Twitter::TweetComponent < ViewComponent::Base
  include Rails.application.routes.url_helpers

  def initialize(tweet:)
    @tweet = tweet
  end

  def tweet_url
    twitter_profile_status_url + @tweet.status_id
  end
end
