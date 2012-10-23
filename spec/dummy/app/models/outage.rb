class Outage
  include Mongoid::Document
  include Mongoid::Timestamps
  include AP::EmailExtension::Email
  
  # Field definitions

  field :"title", type: String

  field :"num_affected", type: Integer

  field :"latitude", type: Float

  field :"longitude", type: Float
     
  def save
    super
    Rails.logger.info "sending email. object id: #{self.id}"
    email_perform(self)
  end

end
