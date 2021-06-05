# == Schema Information
#
# Table name: conversations
#
#  id           :bigint           not null, primary key
#  contact_type :string
#  subject      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contact_id   :bigint
#
# Indexes
#
#  index_conversations_on_contact  (contact_type,contact_id)
#
FactoryBot.define do
  factory :conversation do
    subject { Faker::Hacker.say_something_smart }
    contact { create(:contact) }
  end
end
