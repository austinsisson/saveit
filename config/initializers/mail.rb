ActionMailer::Base.smtp_settings = {
  port:                587,
  address:             'smtp.mailgun.org',
  username:            ENV['MAILGUN_SMTP_LOGIN'],
  password:            ENV['MAILGUN_SMPTP_PASSWORD'],
  domain:              'app32619189.mailgun.org',
  authentication:      :plain,
  content_type:        'text/html'
  }

ActionMailer::Base.delivery_method = :smtp

# Debugging
ActionMailer::Base.raise_delivery_errors = true

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'austinsisson@gmail.com'
    message.cc = nil
    message.bcc = nil
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end