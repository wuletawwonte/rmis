class SubscriberMailer < ApplicationMailer
  def call_posted_email
    @user = params[:user]
    @url = 'https://rmis.amu.edu.et';
    mail(to: @user.email, subject: 'A call is posted'); 
  end
end
