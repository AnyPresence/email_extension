require 'kaminari'

module EmailExtension
  class Message
    include Mongoid::Document
    include Mongoid::Timestamps
    
    paginates_per 10
  
    field :from, type: String
    field :to, type: String
    field :subject, type: String
    field :body, type: String
    
    validates_presence_of :from, :to
    
    attr_accessible :from, :to, :subject, :body
    
  end
end
