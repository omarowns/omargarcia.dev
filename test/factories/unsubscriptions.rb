# == Schema Information
#
# Table name: unsubscriptions
#
#  id              :bigint           not null, primary key
#  author_type     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :bigint           not null
#  conversation_id :bigint           not null
#
# Indexes
#
#  index_unsubscriptions_on_author           (author_type,author_id)
#  index_unsubscriptions_on_conversation_id  (conversation_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#
FactoryBot.define do
  factory :unsubscription do
    conversation { nil }
    author { nil }
  end
end
