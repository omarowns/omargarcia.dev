class ConversationMailer < ApplicationMailer
  default from: 'noreply@omargarcia.mx'

  before_action do
    @post = params[:post]
    @conversation = params[:conversation]
    @recipients = params[:recipients]
  end

  def new_post
    headers["In-Reply-To"] = params[:in_reply_to]
    headers["References"] = params[:references]
    headers["List-Unsubscribe"] = list_unsubscribe

    mail(
      to: params[:to],
      reply_to: params[:reply_to],
      bcc: params[:bcc],
      subject: params[:subject]
    )
  end

  private

  def list_unsubscribe
    "<mailto:unsubscribe+#{conversation_unsubscribe_sgid}@omargarcia.mx>"
  end

  def conversation_unsubscribe_sgid
    @conversation.to_sgid(for: 'mailer_unsubscribe').to_s
  end
end
