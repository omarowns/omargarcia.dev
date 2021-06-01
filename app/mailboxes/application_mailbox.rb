class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /^jobs@/i => :jobs
end
