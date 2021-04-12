class WorkGroup < ApplicationRecord
  belongs_to :profile
  has_many :works

  include Activable

  activable_for :profile_id
end
