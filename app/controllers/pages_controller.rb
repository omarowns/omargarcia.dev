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
    @latest_tweets = TwitterService.new(current_user).latest_tweets
  end
end
