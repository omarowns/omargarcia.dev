# Preview all emails at http://localhost:3000/rails/mailers/bouncer_mailer
class BouncerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bouncer_mailer/non_existing_email
  def non_existing_email
    BouncerMailer.non_existing_email
  end

end
