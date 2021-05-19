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
#  index_sections_on_profile_id  (profile_id)
#  index_sections_on_type        (type) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
class Section < ApplicationRecord
  self.inheritance_column = :_type_disabled
  include Translatable

  belongs_to :profile
  has_many :translations, class_name: 'SectionTranslation'

  validates :type, uniqueness: true

  translates :title

  default_scope { includes :current_translation }
end
