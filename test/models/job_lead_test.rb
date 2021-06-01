# == Schema Information
#
# Table name: job_leads
#
#  id         :bigint           not null, primary key
#  from       :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class JobLeadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
