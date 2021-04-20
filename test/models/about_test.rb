# == Schema Information
#
# Table name: abouts
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE)
#  additional :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#
# Indexes
#
#  index_abouts_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#
require "test_helper"

class AboutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
