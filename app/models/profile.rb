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

  has_many :sections, inverse_of: :profile, dependent: :destroy

  include HasManyImageable, PolymorphicNameable

  def to_s
    "#{type} #{name}"
  end

  def polymorphic_title
    to_s
  end
end
