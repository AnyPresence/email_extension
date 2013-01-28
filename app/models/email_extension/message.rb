require 'kaminari'

module EmailExtension
  class Message
    include Mongoid::Document
    include Mongoid::Timestamps
    
    # attr_accessible :title, :body
    paginates_per 10
  
    field :from, type: String
    field :to, type: String
    field :body, type: String
    
    validates_presence_of :from, :to
    
    attr_accessible :from, :to, :body
    
  end
end
