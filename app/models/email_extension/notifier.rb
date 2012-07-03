module EmailExtension
  class Notifier < ActionMailer::Base
    
    def send_email(from_address, to_address, subject, body)
      account = EmailExtension::Account.first
      ActionMailer::Base.smtp_settings = {
        :user_name => account.sendgrid_username,
        :password => account.sendgrid_password,
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