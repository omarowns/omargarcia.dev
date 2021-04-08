class InterestGroup < ApplicationRecord
  belongs_to :profile
  has_many :interests
end
