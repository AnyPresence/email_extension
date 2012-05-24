FactoryGirl.define do
  factory :email_extension_account, :class => EmailExtension::Account do
    from_address "fake@fake.local"
    to_address "fake@fake.local"
    outgoing_message_format 'sending out email'
    
  end
end