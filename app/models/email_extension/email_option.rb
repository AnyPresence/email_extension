module EmailExtension
  class EmailOption
    include Mongoid::Document
    include Mongoid::Timestamps
  
    belongs_to :anypresence_extension_account
  end
end