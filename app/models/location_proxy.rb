class LocationProxy < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :location
  has_one :profile, through: :parent
  has_one :work, through: :parent
end
