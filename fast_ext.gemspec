$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fast_ext/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fast_ext"
  s.version     = FastExt::VERSION
  s.authors     = ["sgzhe"]
  s.email       = ["sgzhe@163.com"]
  s.homepage    = "https://github.com/songgz/fast_ext/wiki"
  s.summary     = "FastExt generates a UI from model for Rails."
  s.description = "FastExt is a framework for creating enterprise-level application style interfaces. FastExt is released as a Ruby Gem. The gem is to be installed within a Ruby on Rails 3 application."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency "awesome_nested_set", "~> 3.0.0"
  s.add_dependency "bcrypt-ruby"

  #s.add_development_dependency "mysql2"
end
