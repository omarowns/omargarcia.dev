class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing ::ConversationMailbox::MATCHER => :conversation
  routing ::JobsMailbox::MATCHER => :jobs
  routing ::ReplyMailbox::MATCHER => :reply
  routing :all => :conversation
end
