class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :set_pattern

  private

  def after_sign_in_path_for(resource)
    authenticated_user_root_path
  end

  def set_pattern
    @pattern = GeoPattern.generate(Time.zone.now, patterns: [:triangles, :hexagons], color: '#E5E7EB')
  end

  def tld
    request.host.split('.').last
  end

  def switch_locale(&action)
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    locale = extract_locale_from_accept_language_header || I18n.default_locale
    logger.debug "* Locale set to '#{locale}'"
    I18n.with_locale(locale, &action)
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end
end
