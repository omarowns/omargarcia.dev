class About < ApplicationRecord
  belongs_to :profile
  has_many :about_lines

  include HasManyImageable, Activable

  activable_for :profile_id
end
