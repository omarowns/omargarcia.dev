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
class Conversation < ApplicationRecord
  self.inheritance_column = :_type_disabled
  extend Enumerize

  belongs_to :contact, polymorphic: true
  has_many :posts, dependent: :destroy
  has_many :contacts, through: :posts, source: :author, source_type: 'Contact'
  has_many :users, through: :posts, source: :author, source_type: 'User'

  broadcasts_to ->(conversation) { "conversations" }, inserts_by: :prepend, target: "conversations"

  enumerize :type, in: %i(default hello jobs chat), default: :default

  def authors
    contacts + users
  end
end
