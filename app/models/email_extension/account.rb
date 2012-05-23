module EmailExtension 
  class Account
    include Mongoid::Document
    include Mongoid::Timestamps

    field :to, type: String
    field :from, type: String
    field :subject, type: String
    field :outgoing_message_format, type: String
    
    attr_accessible :to, :from, :subject, :outgoing_message_format
  
  end
end