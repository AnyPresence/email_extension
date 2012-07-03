module AP
  module EmailExtension
    module Email
       def self.config_account(config={})
         if config.empty?
           raise "Nothing to configure!"
         end
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
       
       def email_perform(object_instance, options={})
         account = ::EmailExtension::Account.first
         options[:to] ||= account.to_address
         options[:from] ||= account.from_address
         options[:subject] ||= account.subject
         options[:outgoing_message_format] ||= account.outgoing_message_format
         
         ::EmailExtension::Notifier.send_email(object_instance.attributes, object_instance.class.name, options[:from], options[:to], options[:subject], options[:outgoing_message_format]).deliver
       end
    end
  end
end