AP::EmailExtension::Email::config_account({:from_address => "fake@fake.local", :to_address => "fake@fake.com", :subject => "test", :outgoing_message_format => "howdy {{title}}"})

class ActionController::Base
  def authenticate_admin!
  end
end