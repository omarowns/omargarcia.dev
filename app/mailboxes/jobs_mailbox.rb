class JobsMailbox < ApplicationMailbox
  MATCHER = /^jobs@/i

  def process
    JobLead.create(from: from, subject: subject)
  end
end
