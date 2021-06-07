class ReplyMailbox < BaseMailbox
  MATCHER = /^conversation-(\d+)@/

  def process
    conversation.posts.create!(
      author: author,
      body: body,
      message_id: mail.message_id
    )
  end

  private

  def conversation
    Conversation.find(conversation_id)
  end

  def conversation_id
    mail.recipients.find { |recipient| recipient.match(MATCHER) }.match(MATCHER)[1]
  end
end
