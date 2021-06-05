# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :bigint           not null
#
# Indexes
#
#  index_conversations_on_contact_id  (contact_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => contacts.id)
#
FactoryBot.define do
  factory :conversation do
    subject { Faker::Hacker.say_something_smart }
    contact { create(:contact) }
  end
end