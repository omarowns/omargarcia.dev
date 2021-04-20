FactoryBot.define do
  factory :twitter_custom_tweet, class: 'Twitter::CustomTweet' do
    status_id { "MyString" }
    text { "MyString" }
    tweeted_at { "2021-04-20 00:08:58" }
  end
end
