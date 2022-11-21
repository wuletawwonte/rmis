class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('gracesoftwebdesign@gmail.com', 'Arba Minch University Research Directorate')
  layout 'mailer'
end
