# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_sections_on_profile_id           (profile_id)
#  index_sections_on_type_and_profile_id  (type,profile_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class Section < ApplicationRecord
  self.inheritance_column = :_type_disabled
  include Translatable

  belongs_to :profile, inverse_of: :sections

  validates :type, uniqueness: { scope: :profile_id }

  default_scope { includes :current_translation }

  accepts_nested_attributes_for :translations, reject_if: proc { |attrs| attrs['title'].blank? }

  translates :title, :content
end
