# Preview all emails at http://localhost:3000/rails/mailers/conversation_mailer
class ConversationMailerPreview < ActionMailer::Preview
  def new_post
    ConversationMailer.with(
      to: "noreply@omargarcia.mx",
      reply_to: reply_to_email,
      bcc: recipients.map { |r| "#{r.name} <#{r.email}>"},
      subject: subject,
      post: post,
      conversation: conversation,
      in_reply_to: previous_message_ids.last,
      references: previous_message_ids
    ).new_post
  end

  protected

  def reply_to_email
    "conversation-#{conversation.id}@omargarcia.mx"
  end

  def conversation
    @conversation ||= post.conversation
  end

  def post
    @post ||= Post.last || FactoryBot.create(:post)
  end

  def recipients
    @recipients ||= conversation.authors - [post.author]
  end

  def subject
    "RE: #{conversation.subject}"
  end

  def previous_message_ids
    @previous_message_ids ||= conversation.posts.pluck(:message_id) - [post.message_id]
  end
end
