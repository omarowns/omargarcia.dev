class Work < ApplicationRecord
  belongs_to :work_group
  has_one :profile, through: :work_group

  include HasManyImageable, HasManyLocatable
end
