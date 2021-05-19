# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  animoji    :string
#  name       :string
#  title      :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Profile < ApplicationRecord
  self.inheritance_column = :_type_disabled
  is_impressionable

  has_many :abouts
  has_many :about_lines, through: :abouts, inverse_of: :profile

  has_many :work_groups
  has_many :works, through: :work_groups, inverse_of: :profile

  include HasManyImageable, ActiveFromActivableRecord, PolymorphicNameable

  has_one_active :about
  has_one_active :work_group

  has_many_active :about_lines, through: :about
  has_many_active :works, through: :work_group

  delegate :title, :additional, to: :about, prefix: true, allow_nil: true
  delegate :title, :additional, to: :work_group, prefix: true, allow_nil: true

  def to_s
    "#{type} #{name}"
  end

  def polymorphic_title
    to_s
  end
end
