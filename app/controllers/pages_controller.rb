class PagesController < ApplicationController
  def index
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'MX')
  end

  def tech
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: 'DEV')
  end
end
