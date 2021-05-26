class PagesController < ApplicationController
  # impressionist actions: %i(index)
  before_action :load_profile
  after_action :create_impression

  def index
    @section = @profile.sections.find_by(type: 'intro')
  end

  def about
    @section = @profile.sections.find_by(type: 'about')
  end

  private

  def create_impression
    data = {
      host: request.host,
      path: request.path,
      ua: request.user_agent
    }
    impressionist(@profile, data.to_json)
  end

  def load_profile
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: tld) || Profile.includes(helpers.profiles_include_hash).first
  end
end
