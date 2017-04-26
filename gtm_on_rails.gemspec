$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gtm_on_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gtm_on_rails"
  s.version     = GtmOnRails::VERSION
  s.authors     = ["ykogure"]
  s.email       = ["renkin1008@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of GtmOnRails."
  s.description = "TODO: Description of GtmOnRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "mysql2"
end
