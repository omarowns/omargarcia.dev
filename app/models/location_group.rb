class LocationGroup < ApplicationRecord
  belongs_to :profile
  has_many :location_proxies, as: :parent
  has_many :locations, through: :location_proxies, source: :parent, source_type: 'LocationGroup'
end
