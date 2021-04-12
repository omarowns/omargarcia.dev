class Interest < ApplicationRecord
  belongs_to :interest_group
  has_one :profile, through: :interest_group
end
