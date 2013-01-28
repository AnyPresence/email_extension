module AP
  module EmailExtension
    module Email
       def self.config_account(config={})
         if config.empty?
           raise "Nothing to configure!"
         end
         config = HashWithIndifferentAccess.new(config)
         
         # Override the twilio account setting if these environment variables are set.
         config[:sendgrid_username] = ENV['EMAIL_EXTENSION_SENDGRID_USERNAME'] unless ENV['EMAIL_EXTENSION_SENDGRID_USERNAME'].nil?
         config[:sendgrid_password] = ENV['EMAIL_EXTENSION_SENDGRID_PASSWORD'] unless ENV['EMAIL_EXTENSION_SENDGRID_PASSWORD'].nil?
         
         account = nil
         if !::EmailExtension::Account.all.blank?
           account = ::EmailExtension::Account.first
           account.update_attributes(config)
         else
           account = ::EmailExtension::Account.new(config)
           account.save!
         end

         menu_options = config[:menu_options] 
         if !menu_options.nil?
           menu_options.each do |m|
             menu_option = account.menu_options.build(m)
             menu_option.save
           end
         end
       end
       
       # Builds text message to send out.
       #  +object_instance+ is the object instance
       #  +options+ is a hash that includes: +:from_address+, from address; +:to_address+, to address; +:subject+, email subject; +:outgoing_message_format+, outgoing message
       def email_perform(object_instance, options={})
         account = ::EmailExtension::Account.first
         options = HashWithIndifferentAccess.new(options)
         options[:to_address] ||= account.to_address
         options[:from_address] ||= account.from_address
         options[:subject] ||= account.subject
         options[:outgoing_message_format] ||= account.outgoing_message_format
         
         ::EmailExtension::Notifier.send_email(object_instance.attributes, object_instance.class.name, options[:from_address], options[:to_address], options[:subject], options[:outgoing_message_format]).deliver
       end
       
       def self.json_config
         @@json ||= ActiveSupport::JSON.decode(File.read("#{File.dirname(__FILE__)}/../../../manifest.json"))
       end
    end
  end
end