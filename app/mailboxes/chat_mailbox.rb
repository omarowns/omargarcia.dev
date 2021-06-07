class ChatMailbox < BaseMailbox
  MATCHER = /^chat(-(\d))?@/

  def process
    conversation.posts.create(
      author: author,
      body: body,
      message_id: mail.message_id
    )
  end

  private

  def chat_id
    mail.recipients.find { |recipient| MATCHER.match(recipient) }.match(MATCHER)[2]
  end

  def conversation
    @conversation ||= if start_thread?
                        Conversation.create(
                          subject: mail.subject,
                          contact: author,
                          type: :chat)
                      else
                        Conversation.find(chat_id)
                      end
  end

  def start_thread?
    chat_id.blank?
  end
end
