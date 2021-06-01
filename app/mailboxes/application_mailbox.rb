class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing JobsMailbox::MATCHER => :jobs

  def from
    @from ||= mail.from
  end

  def subject
    @subject ||- mail.subject
  end
end
