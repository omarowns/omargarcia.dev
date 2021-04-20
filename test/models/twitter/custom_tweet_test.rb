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
require "test_helper"

class Twitter::CustomTweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
