module EmailExtension
  class Notifier < ActionMailer::Base
  
    def send_email(from_address, to_address, subject, body)
      mail(:from => from_address, :to => to_address, :subject => subject, :body => body)
    end
    
  end
end