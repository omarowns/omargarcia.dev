# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  author_type     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :bigint           not null
#  conversation_id :bigint           not null
#  message_id      :string
#
# Indexes
#
#  index_posts_on_author           (author_type,author_id)
#  index_posts_on_conversation_id  (conversation_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#
FactoryBot.define do
  factory :post do
    message_id { nil }
    body { Faker::Lorem.paragraph(sentence_count: 1, supplemental: false, random_sentences_to_add: 4) }

    before_create do |post|
      post.conversation = create(:conversation)
      post.author = post.conversation.author
    end
  end
end
