class ApplicationController < ActionController::Base
  before_action :set_pattern

  private

  def after_sign_in_path_for(resource)
    authenticated_user_root_path
  end

  def set_pattern
    @pattern = GeoPattern.generate(request.ip, patterns: [:hexagons])
  end
end
