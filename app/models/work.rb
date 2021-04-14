class Work < ApplicationRecord
  belongs_to :work_group
  has_one :profile, through: :work_group

  include HasManyImageable, HasManyLocatable, PolymorphicNameable

  def polymorphic_title
    title
  end

  def to_s
    "#{id}: #{title}"
  end
end
