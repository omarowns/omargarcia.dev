class NoReplyMailbox < BaseMailbox
  MATCHER = /^noreply.*@/

  def process
  end
end
