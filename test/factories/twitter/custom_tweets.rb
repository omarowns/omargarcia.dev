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
FactoryBot.define do
  factory :twitter_custom_tweet, class: 'Twitter::CustomTweet' do
    status_id { "MyString" }
    text { "MyString" }
    tweeted_at { "2021-04-20 00:08:58" }
  end
end
