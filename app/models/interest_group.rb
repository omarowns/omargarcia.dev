class InterestGroup < ApplicationRecord
  belongs_to :profile
  has_many :interests

  include Activable

  activable_for :profile_id
end
