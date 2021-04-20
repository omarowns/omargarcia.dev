class PagesController < ApplicationController
  before_action :load_tweets

  def index
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'MX')
  end

  def tech
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'DEV')
  end

  private

  def load_tweets
    @last_tweet = Twitter::CustomTweet.last
    @last_track = Spotify::Track.last
  end
end
