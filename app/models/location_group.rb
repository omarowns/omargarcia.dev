class LocationGroup < ApplicationRecord
  belongs_to :profile

  include HasManyImageable, HasManyLocatable, Activable, PolymorphicNameable

  activable_for :profile_id

  def polymorphic_title
    to_s
  end

  def to_s
    "#{id}: #{title}"
  end
end
