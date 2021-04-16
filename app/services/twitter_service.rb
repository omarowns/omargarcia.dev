class TwitterService
  attr_reader :client

  def initialize(user)
    @user = user
  end

  def latest_tweets(count: 50, trim_user: true, exclude_replies: true, include_rts: false)
    @latest_tweets ||= client.user_timeline(
      "omarowns",
      count: count,
      trim_user: trim_user,
      exclude_replies: exclude_replies,
      include_rts: include_rts
    ).map(&:to_h)
  end

  private

  def client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.twitter[:api_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:api_secret]
      config.access_token        = twitter_authenticable.token if @user
      config.access_token_secret = twitter_authenticable.token_secret if @user
    end
  end

  def twitter_authenticable
    twitter_authenticables.first
  end

  def twitter_authenticables
    @user.authenticables.where(provider: 'twitter')
  end
end
