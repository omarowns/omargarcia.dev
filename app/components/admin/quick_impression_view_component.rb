# frozen_string_literal: true

class Admin::QuickImpressionViewComponent < ViewComponent::Base
  include ActionView::Helpers::DateHelper

  def initialize(impression:)
    I18n.locale = 'en'
    @impression = impression
  end

  def visitor
    @impression.ip_address || 'Undefined'
  end

  def parsed_message
    @_parsed_message ||= begin
      return "" unless @impression.message.present?
      JSON.parse(@impression.message)
    rescue JSON::ParserError => e
      ""
    end
  end

  def controller_action
    [@impression.controller_name, @impression.action_name].join('#')
  end

  def viewed_at
    time_ago_in_words(@impression.created_at)
  end

  def from
    @impression.referrer
  end
end
