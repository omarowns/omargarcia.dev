# == Schema Information
#
# Table name: conversations
#
#  id           :bigint           not null, primary key
#  contact_type :string
#  subject      :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contact_id   :bigint
#
# Indexes
#
#  index_conversations_on_contact  (contact_type,contact_id)
#
require "test_helper"

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
