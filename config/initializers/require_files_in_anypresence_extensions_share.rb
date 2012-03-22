Dir[Rails.root + 'vendor/gems/anypresence_extension-0.0.1/lib/anypresence_extension/shared/anypresence_extension/**/*.rb'].each do |file|
  require file
end
