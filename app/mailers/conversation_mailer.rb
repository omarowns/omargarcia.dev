class ConversationMailer < ApplicationMailer
  default from: 'noreply@omargarcia.mx'

  before_action do
    @post = params[:post]
    @conversation = params[:conversation]
  end

  def new_post
    headers["In-Reply-To"] = params[:in_reply_to]
    headers["References"] = params[:references]

    mail(
      to: params[:to],
      reply_to: params[:reply_to],
      bcc: params[:bcc],
      subject: params[:subject]
    )
  end
end
