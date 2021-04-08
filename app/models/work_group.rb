class WorkGroup < ApplicationRecord
  belongs_to :profile
  has_many :works
end
