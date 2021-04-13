class LocationGroup < ApplicationRecord
  belongs_to :profile
  has_many :location_proxies, as: :locatable
  has_many :locations, through: :location_proxies, source: :location, source_type: 'LocationGroup'

  include HasManyImageable, Activable

  activable_for :profile_id
end
