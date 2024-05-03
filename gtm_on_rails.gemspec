$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gtm_on_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gtm_on_rails"
  s.version     = GtmOnRails::VERSION
  s.authors     = ["ykogure"]
  s.email       = ["renkin1008@gmail.com"]
  s.homepage    = "https://github.com/ZIGExN/gtm_on_rails"
  s.summary     = "An plugin that integrate Google Tag Manager easy with Rails"
  s.description = "An plugin that integrate Google Tag Manager easy with Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "README.ja.md"]

  s.add_dependency "rails", ">= 3.2.22"
  s.add_dependency "puma"

  s.add_development_dependency "sqlite3"
end
