# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  def call_posted_email
    SubscriberMailer.with(call: Call.first).call_posted_email
  end

end
