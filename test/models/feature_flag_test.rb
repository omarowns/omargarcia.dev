# == Schema Information
#
# Table name: feature_flags
#
#  id          :bigint           not null, primary key
#  active      :boolean
#  description :string
#  key         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class FeatureFlagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
