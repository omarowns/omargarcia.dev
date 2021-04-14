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

  include HasManyImageable, ActiveFromActivableRecord, PolymorphicNameable

  has_one_active :about
  has_one_active :work_group
  has_one_active :interest_group
  has_one_active :location_group

  has_many_active :about_lines, through: :about
  has_many_active :works, through: :work_group
  has_many_active :interests, through: :interest_group
  has_many_active :location_proxies, through: :location_group, inverse_of: :location
  has_many_active :locations, through: :location_proxies, source: :location, inverse_of: :location_proxies

  delegate :title, :additional, to: :about, prefix: true, allow_nil: true
  delegate :title, :additional, to: :work_group, prefix: true, allow_nil: true
  delegate :title, :additional, to: :interest_group, prefix: true, allow_nil: true
  delegate :title, :additional, to: :location_group, prefix: true, allow_nil: true

  def main_image
    main_images.first
  end

  def featured_image
    featured_images.first
  end

  def to_s
    "#{type} #{name}"
  end

  def polymorphic_title
    to_s
  end
end
