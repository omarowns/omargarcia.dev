class UnsubscribeMailbox < BaseMailbox
  MATCHER = /^unsubscribe\+(.*)@/

  def process
    return unless conversation.present?

    Unsubscription.create(conversation: conversation, author: author)
  end

  private

  def conversation
    @conversation ||= GlobalID::Locator.locate_signed(conversation_unsubscribe_sgid, for: 'mailer_unsubscribe')
  end

  def conversation_unsubscribe_sgid
    mail.recipients.find { |recipient| recipient.match(MATCHER) }.match(MATCHER)[1]
  end
end
