module EmailExtension
  class Notifier < ActionMailer::Base
    
    def send_email(from_address, to_address, subject, body)
      ActionMailer::Base.smtp_settings = {
        :user_name => ENV['EMAIL_EXTENSION_SENDGRID_USERNAME'],
        :password => ENV['EMAIL_EXTENSION_SENDGRID_PASSWORD'],
        :port => 25,
        :domain => "anypresence.com",
        :address => "smtp.sendgrid.net",
        :authentication => :plain
      }
      ActionMailer::Base.delivery_method = :smtp
      
      mail(:from => from_address, :to => to_address, :subject => subject, :body => body)
    end
    
  end
end