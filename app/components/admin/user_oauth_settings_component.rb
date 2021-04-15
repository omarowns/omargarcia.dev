# frozen_string_literal: true

class Admin::UserOauthSettingsComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
