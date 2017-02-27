# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'framgia.com',
  :address => 'smtp.sendgrid.net',
  :port => 25,
  :authentication => :plain,
  :enable_starttls_auto => true
}

config.action_mailer.default_url_options = { :host => 'yourapp.heroku.com' }
