class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_MOUNTT']
  layout 'mailer'
end
