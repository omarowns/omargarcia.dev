class Location < ApplicationRecord
  has_many :location_proxies

  has_many :location_images, through: :location_proxies, source: :locatable, source_type: 'Image'
  has_many :location_groups, through: :location_proxies, source: :locatable, source_type: 'LocationGroup'
  has_many :location_works, through: :location_proxies, source: :locatable, source_type: 'Work'

  include HasManyImageable, PolymorphicNameable

  def polymorphic_title
    value
  end

  def to_s
    "#{id}: #{value}"
  end
end
