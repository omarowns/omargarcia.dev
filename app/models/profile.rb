class Profile < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_one :about
  has_many :about_lines, through: :about, inverse_of: :profile
  has_one :work_group
  has_many :works, through: :work_group, inverse_of: :profile
  has_one :interest_group
  has_many :interests, through: :interest_group, inverse_of: :profile
  has_one :location_group
  has_many :locations, through: :location_group, inverse_of: :profile
  has_many :profile_images
  has_one :main_image, through: :profile_images, source: :main_image, inverse_of: :profile
  has_one :featured_image, through: :profile_images, source: :featured_image, inverse_of: :profile
end
