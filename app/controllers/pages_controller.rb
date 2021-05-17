class PagesController < ApplicationController
  impressionist actions: %i(index tech)
  before_action :load_player
  before_action :load_background_image

  def index
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'MX')
    impressionist(@profile)
  end

  def tech
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'DEV')
    impressionist(@profile)
  end

  def lnkdin
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'LINKEDIN')
  end

  private

  def load_player
    @player = User.first.player
  end

  def load_background_image
    @image_bg = Image.find_by(title: 'parklot')
  end
end
