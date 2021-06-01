class PagesController < ApplicationController
  # impressionist actions: %i(index)
  before_action :load_profile
  after_action :create_impression_and_visit

  def index
    @section = @profile.sections.find_by(type: 'intro')
  end

  def about
    @section = @profile.sections.find_by(type: 'about')
  end

  def contact
    @section = @profile.sections.find_by(type: 'contact')
  end

  private

  def create_impression_and_visit
    impression = create_impression
    create_visit(impression)
  end

  def create_impression
    data = {
      host: request.host,
      path: request.path,
      ua: request.user_agent
    }
    impressionist(@profile, data.to_json)
  end

  def create_visit(impression)
    Visit.create(impression_id: impression&.id, ip: impression&.ip_address)
  end

  def load_profile
    @profile = Profile.includes(helpers.profiles_include_hash).find_by(type: tld) || Profile.includes(helpers.profiles_include_hash).second
  end
end
