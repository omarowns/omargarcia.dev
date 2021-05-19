# == Schema Information
#
# Table name: section_translations
#
#  id         :bigint           not null, primary key
#  locale     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  section_id :bigint           not null
#
# Indexes
#
#  index_section_translations_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#
class SectionTranslation < ApplicationRecord
  belongs_to :section
end
