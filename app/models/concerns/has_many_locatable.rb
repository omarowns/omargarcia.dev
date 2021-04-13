require 'active_support/concern'

module HasManyLocatable
  extend ActiveSupport::Concern

  included do
    has_many :location_proxies, as: :locatable, inverse_of: :locatable
    has_many :locations, through: :location_proxies, source: :location, inverse_of: :location_proxies
  end

  class_methods do
  end
end
