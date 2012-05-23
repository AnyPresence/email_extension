FactoryGirl.define do
  factory :email_extension_account, :class => EmailExtension::Account do
    from "fake@fake.local"
    to "fake@fake.local"
    outgoing_message_format 'sending out email'
    
  end
end