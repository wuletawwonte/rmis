# frozen_string_literal: true

class SubscriberMailer < ApplicationMailer
  # Send email when a research call is posted
  def call_posted_email
    @user = params[:subscriber]
    @call = params[:call]
    @url = params[:url]
    @subscribed = true
    mail(to: @user.email, subject: 'RMIS: Call for research posted')
  end

  def email_added
    @subscriber = params[:subscriber]
    @subscribed = false
    mail(to: @subscriber.email, subject: 'Please verify your email address')
  end

  def email_verified
    @subscriber = params[:subscriber]
    @subscribed = true
    mail(to: @subscriber.email, subject: 'Welcome to RMIS research call notification service')
  end
end
