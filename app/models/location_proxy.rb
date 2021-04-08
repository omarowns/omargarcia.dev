class LocationProxy < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :location
end
