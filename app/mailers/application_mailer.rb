class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('rmis@amu.edu.et', 'Arba Minch University Research Directorate')
  layout 'mailer'
end
