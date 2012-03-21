require AnypresenceExtension::Engine.root.join('app', 'models', 'anypresence_extension', 'account')

module AnypresenceExtension 
  class Account < ActiveRecord::Base
    include AnypresenceExtension::Common::AnypresenceClient
    
    attr_accessible :email_from
  
    has_many :email_options, :dependent => :destroy
    has_many :consume_email_options, :dependent => :destroy
    
    def get_fields
      field_names = []
      res = ap_client.metadata.fetch.to_json
      res.each do |x|
        fields = x["field_definitions"]
        fields.each do |f|
          h = {}
          h[:name] = f["name"]
          h[:_id] = f["_id"]
          field_names.push(h)
        end
      end
      field_names
    end
    
    # Finds the object definition name.
    def find_object_name(text)
      text.strip
    end
    
    def create_object_instance(consume_email_option, data)
      ap_client.data(consume_email_option.name)
      ap_client.create({:object_instance =>{consume_email_option.body_map => data}})
    end
  end
end