class PagesController < ApplicationController
  impressionist actions: %i(index tech)
  before_action :load_player

  def index
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'MX')
  end

  def tech
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'DEV')
  end

  private

  def load_player
    @player = User.first.player
  end
end
