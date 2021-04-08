class Profile < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_one :about
  has_many :about_lines, through: :about
end
