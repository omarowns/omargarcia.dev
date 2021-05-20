class PagesController < ApplicationController
  impressionist actions: %i(index)
  before_action :load_profile

  def index
    @section = @profile.sections.find_by(type: 'intro')
  end

  def about
    @section = @profile.sections.find_by(type: 'about')
  end

  private

  def load_profile
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: tld) || Profile.includes(helpers.profiles_include_hash).first
  end
end
