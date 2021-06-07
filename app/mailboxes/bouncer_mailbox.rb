class BouncerMailbox < ApplicationMailbox
  def process
    bounce_with BouncerMailer.with(
                  inbound_email: inbound_email,
                  forwarder: mail.from
                ).non_existing_email
  end
end
