class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing ::ConversationMailbox::MATCHER => :conversation
  routing ::JobsMailbox::MATCHER => :jobs
  routing ::ReplyMailbox::MATCHER => :reply
  routing ::ChatMailbox::MATCHER => :chat
  routing :all => :conversation
end
