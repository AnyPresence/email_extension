# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "anypresence_extensions_shared_logic/version"

Gem::Specification.new do |s|
  s.name        = "anypresence_extensions_shared_logic"
  s.version     = AnypresenceExtensionsSharedLogic::VERSION
  s.authors     = ["Anypresence"]
  s.email       = ["fake@fake.local"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""

  s.rubyforge_project = "anypresence_extensions_shared_logic"
  
  s.add_development_dependency "json"
  s.add_development_dependency "multi_json"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"  
  s.add_development_dependency "liquid"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
