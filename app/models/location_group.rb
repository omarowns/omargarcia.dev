class LocationGroup < ApplicationRecord
  belongs_to :profile

  include HasManyImageable, HasManyLocatable, Activable

  activable_for :profile_id
end
