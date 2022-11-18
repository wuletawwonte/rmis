class SubscriberMailer < ApplicationMailer
  
  # Send email when a research call is posted
  def call_posted_email
    @user = "wuletaw.wonte@amu.edu.et"
    @call = params[:call]
    @url = 'https://rmis.amu.edu.et';
    mail(to: @user, subject: 'A call is posted'); 
  end

  def email_added
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: 'Please verify your email address')
  end

  def email_verified
    @subscriber = params[:subscriber]
    mail(to: @subscriber.email, subject: 'Welcome to RMIS research call notification service')
  end
end
