$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ds_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ds_auth"
  s.version     = DsAuth::VERSION
  s.authors     = ["Michael Chittenden"]
  s.email       = ["mchittenden@dosomething.org"]
  s.homepage    = "http://www.dosomething.org"
  s.summary     = "DoSomething Auth system"
  s.description = "Sets up basic auth system used by DoSomething.org and its associated apps."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "compass-rails", "~> 2.0.alpha.0"

  s.add_development_dependency "pg"
end
