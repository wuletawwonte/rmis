# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  def call_posted_email
    SubscriberMailer.with(call: Call.first, subscriber: Subscriber.first).call_posted_email
  end

  def email_added
    SubscriberMailer.with(subscriber: Subscriber.last).email_added
  end

  def email_verified
    SubscriberMailer.with(subscriber: Subscriber.last).email_verified
  end

end
