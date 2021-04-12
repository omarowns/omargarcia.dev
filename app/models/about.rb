class About < ApplicationRecord
  belongs_to :profile
  has_many :about_lines

  include Activable

  activable_for :profile_id
end
