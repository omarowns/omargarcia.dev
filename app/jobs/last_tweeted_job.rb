class LastTweetedJob < ApplicationJob
  queue_as :default

  def perform(*args)
    service = TwitterService.new(username: 'omarowns')
    tweet = service.latest_tweets&.first

    c_tweet = Twitter::CustomTweet.from(tweet)

    c_tweet.save
  end
end
