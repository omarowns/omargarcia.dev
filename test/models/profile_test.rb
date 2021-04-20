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
require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
