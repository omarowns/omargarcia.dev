j# == Schema Information
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
class Post < ApplicationRecord
  belongs_to :conversation
  belongs_to :author, polymorphic: true

  has_rich_text :body
  has_many_attached :attachments

  validates :body, presence: true

  broadcasts_to :conversation

  after_create -> { ReplyJob.set(wait: 30.seconds).perform_later(post: self) }
end
