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
class Conversation < ApplicationRecord
  belongs_to :contact
  has_many :posts, dependent: :destroy
  has_many :contacts, through: :posts, source: :author, source_type: 'Contact'
  has_many :users, through: :posts, source: :author, source_type: 'User'

  broadcasts_to ->(conversation) { "conversations" }, inserts_by: :prepend, target: "conversations"

  def authors
    contacts + users
  end
end
