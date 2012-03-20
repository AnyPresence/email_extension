ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :port => 25,
  :domain => "anypresence.com",
  :address => "smtp.sendgrid.net",
  :authentication => :plain
}
ActionMailer::Base.delivery_method = :smtp