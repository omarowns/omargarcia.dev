class AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!

  private
  def switch_locale
    I18n.locale = 'en'
  end
end
