class LocationProxy < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  belongs_to :location
  has_one :profile, through: :location
  has_one :work, through: :location
end
