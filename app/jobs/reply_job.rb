class ReplyJob < ApplicationJob
  queue_as :default

  attr_reader :post

  def perform(post)
    return if post.message_id?
    @post = post

    mail = ConversationMailer.with(
      to: "noreply@omargarcia.mx",
      reply_to: reply_to_email,
      bcc: recipients.map { |r| "#{r.name} <#{r.email}>"},
      subject: subject,
      post: post,
      conversation: conversation,
      in_reply_to: previous_message_ids.last,
      references: previous_message_ids
    ).new_post.deliver_now

    post.update(message_id: mail.message_id)
  end

  def reply_to_email
    "conversation-#{conversation.id}@omargarcia.mx"
  end

  def conversation
    @conversation ||= post.conversation
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
