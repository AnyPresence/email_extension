module EmailExtension
  class Notifier < ActionMailer::Base
    
    def send_email(params, object_name, from_address, to_address, subject, body)
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
      
      formatted_body = ::EmailExtension::Common::LiquidTemplate.parse_format_string(body, object_name, params)
      mail(:from => from_address, :to => to_address, :subject => subject, :body => formatted_body)
    end
    
  end
end