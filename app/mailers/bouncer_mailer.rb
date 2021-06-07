class BouncerMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bouncer_mailer.non_existing_email.subject
  #
  def non_existing_email
    @inbound_email = params[:inbound_email]
    mail to: params[:forwarder]
  end
end
