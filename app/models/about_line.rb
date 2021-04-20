# == Schema Information
#
# Table name: about_lines
#
#  id         :bigint           not null, primary key
#  line       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  about_id   :bigint           not null
#
# Indexes
#
#  index_about_lines_on_about_id  (about_id)
#
# Foreign Keys
#
#  fk_rails_...  (about_id => abouts.id)
#
class AboutLine < ApplicationRecord
  belongs_to :about
  has_one :profile, through: :about
end
