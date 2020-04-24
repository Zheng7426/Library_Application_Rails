# Load the Rails application.
require_relative 'application'

#Sendgrid Configuration
# ActionMailer::Base.smtp_settings = {
#     :user_name => '',
#     :password => Rails.application.secrets.sendgrid_password,
#     # :password => Rails.application.secrets.sendgrid_password,
#     :domain => '',
#     :address => 'smtp.sendgrid.net',
#     :port => 465,
#     :authentication => :plain,
#     :enable_starttls_auto => true
# }

# Initialize the Rails application.
Rails.application.initialize!
