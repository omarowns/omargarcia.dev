class Twitter::CustomTweet < ApplicationRecord
  self.table_name = 'twitter_custom_tweets'

  validates :status_id, uniqueness: true

  def self.from(tweet)
    new(
      status_id: tweet[:id],
      text: tweet[:text],
      tweeted_at: DateTime.parse(tweet[:created_at])
    )
  end
end
