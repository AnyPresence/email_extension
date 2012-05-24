module EmailExtension 
  class Account
    include Mongoid::Document
    include Mongoid::Timestamps

    field :to_address, type: String
    field :from_address, type: String
    field :subject, type: String
    field :outgoing_message_format, type: String
    
    attr_accessible :to_address, :from_address, :subject, :outgoing_message_format
  
  end
end