# == Schema Information
#
# Table name: interests
#
#  id                :bigint           not null, primary key
#  position          :integer
#  value             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  interest_group_id :bigint           not null
#
# Indexes
#
#  index_interests_on_interest_group_id  (interest_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (interest_group_id => interest_groups.id)
#
require "test_helper"

class InterestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
