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
      formatted_from_address = ::EmailExtension::Common::LiquidTemplate.parse_format_string(from_address, object_name, params)
      formatted_to_address = ::EmailExtension::Common::LiquidTemplate.parse_format_string(to_address, object_name, params)
      formatted_subject = ::EmailExtension::Common::LiquidTemplate.parse_format_string(subject, object_name, params)
      
      message = mail(from: formatted_from_address, to: formatted_to_address, subject: formatted_subject, body: formatted_body)
      ::EmailExtension::Message.create(from: formatted_from_address, to: formatted_to_address, subject: formatted_subject, body: formatted_body)
      message
    end
    
  end
end