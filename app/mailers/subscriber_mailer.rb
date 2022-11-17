class SubscriberMailer < ApplicationMailer
  
  def call_posted_email
    @user = "wuletaw.wonte@amu.edu.et"
    @call = params[:call]
    @url = 'https://rmis.amu.edu.et';
    mail(to: @user, subject: 'A call is posted'); 
  end
end
