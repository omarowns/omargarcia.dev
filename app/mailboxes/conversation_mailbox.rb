class ConversationMailbox < BaseMailbox
  MATCHER = /^hello@/

  def process
    conversation = Conversation.create(
      subject: mail.subject,
      contact: author,
      type: :hello
    )
    conversation.posts.create(
      author: author,
      body: body,
      message_id: mail.message_id
    )
  end
end
