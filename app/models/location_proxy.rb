class LocationProxy < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  belongs_to :location

  delegate :value, to: :location, prefix: true, allow_nil: false
end
