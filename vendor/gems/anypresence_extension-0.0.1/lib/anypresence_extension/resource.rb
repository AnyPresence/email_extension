require 'multi_json'

module AnypresenceExtension
  class Resource
    def fetch
      if @client.nil?
        raise "Client must be set..."
      end
      update_uri
      @client.fetch
    end
    
    def update_uri
      raise "Must be implemented by subclass."
    end
  end
end