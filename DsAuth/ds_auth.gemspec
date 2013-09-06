$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ds_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ds_auth"
  s.version     = DsAuth::VERSION
  s.authors     = ["Michael Chittenden", "Maxwell Watson", "Marvin Qian"]
  s.email       = ["mchittenden@dosomething.org", "mwatson@dosomething.org",]
  s.homepage    = "http://www.dosomething.org"
  s.summary     = "Auth services for DoSomething Rails projects."
  s.description = "Sets up authorization details for DoSomething rails projects.  Creates login/register functionality, and introduces the Services module."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "pg"
end
