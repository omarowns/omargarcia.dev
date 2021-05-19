class PagesController < ApplicationController
  impressionist actions: %i(index tech)
  before_action :load_profile
  before_action :load_player
  before_action :load_background_image

  def index
    impressionist(@profile)
  end

  def tech
    impressionist(@profile)
  end

  def lnkdin
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'linkedin')
  end

  private

  def load_profile
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: tld) || Profile.includes(helpers.profiles_include_hash).first
  end

  def load_player
    @player = User.first.player
  end

  def load_background_image
    @image_bg = Image.find_by(title: 'parklot')
  end
end
