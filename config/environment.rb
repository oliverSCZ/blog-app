# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
    :user_name => 'a2347eb9e2b12b',
    :password => '29bc5c61f66375',
    :address => 'smtp.mailtrap.io',
    :domain => 'smtp.mailtrap.io',
    :port => '2525',
    :authentication => :cram_md5
}