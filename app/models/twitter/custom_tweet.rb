# == Schema Information
#
# Table name: twitter_custom_tweets
#
#  id         :bigint           not null, primary key
#  text       :string
#  tweeted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status_id  :string
#
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
