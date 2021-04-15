# frozen_string_literal: true

class Admin::OauthSettingsComponent < ViewComponent::Base
  include Rails.application.routes.url_helpers

  def initialize(user:, provider:)
    @user = user
    @provider = provider
  end

  def provider_name
    @provider.to_s.capitalize
  end

  def provider_oauth_settings_url
    polymorphic_url("#{@provider}_oauth_settings")
  end

  def omniauth_authorization_path
    polymorphic_url([:user, @provider, :omniauth_authorize])
  end

  def user_has_provider_setup?
    @user.authenticables.where(provider: @provider).any?
  end
end
