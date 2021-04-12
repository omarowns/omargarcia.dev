class Profile < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :abouts
  has_many :about_lines, through: :abouts, inverse_of: :profile

  has_many :work_groups
  has_many :works, through: :work_groups, inverse_of: :profile

  has_many :interest_groups
  has_many :interests, through: :interest_groups, inverse_of: :profile

  has_many :location_groups
  has_many :location_proxies, through: :location_groups, inverse_of: :profile
  has_many :locations, through: :location_groups, inverse_of: :profile

  has_many :profile_images
  has_many :images, through: :profile_images
  has_many :main_images, ->{ where(profile_images: { main: true }) }, through: :profile_images, source: :image, inverse_of: :profile_images
  has_many :featured_images, ->{ where(profile_images: { featured: true }) }, through: :profile_images, source: :image, inverse_of: :profile_images

  include ActiveFromActivableRecord

  has_one_active :about
  has_one_active :work_group
  has_one_active :interest_group
  has_one_active :location_group

  has_many_active :about_lines, through: :about
  has_many_active :works, through: :work_group
  has_many_active :interests, through: :interest_group
  has_many_active :location_proxies, through: :location_group, inverse_of: :parent
  has_many_active :locations, through: :location_group, inverse_of: :location_proxies

  def main_image
    main_images.first
  end

  def featured_image
    featured_images.first
  end
end
