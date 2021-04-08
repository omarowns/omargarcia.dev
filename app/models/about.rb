class About < ApplicationRecord
  belongs_to :profile
  has_many :about_lines
end
