class JobsMailbox < BaseMailbox
  MATCHER = /^jobs@/i

  def process
    conversation = Conversation.create(
      subject: mail.subject,
      contact: author,
      type: :jobs
    )
    conversation.posts.create(
      author: author,
      body: body,
      message_id: mail.message_id
    )
  end
end
