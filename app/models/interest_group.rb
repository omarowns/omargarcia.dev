class InterestGroup < ApplicationRecord
  belongs_to :profile
  has_many :interests

  include HasManyImageable, Activable, PolymorphicNameable

  activable_for :profile_id

  def to_s
    "#{id}: #{title}"
  end
end
