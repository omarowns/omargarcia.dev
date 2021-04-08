class Profile < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_one :about
  has_many :about_lines, through: :about
  has_one :work_group
  has_many :works, through: :work_group
  has_one :interest_group
end
