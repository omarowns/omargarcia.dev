require "test_helper"

class BouncerMailerTest < ActionMailer::TestCase
  test "non_existing_email" do
    mail = BouncerMailer.non_existing_email
    assert_equal "Non existing email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
