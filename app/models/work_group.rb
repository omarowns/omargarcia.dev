class WorkGroup < ApplicationRecord
  belongs_to :profile
  has_many :works

  include HasManyImageable, Activable

  activable_for :profile_id

  def to_s
    "#{id}: #{title}"
  end
end
