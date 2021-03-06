$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_dict/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_dict"
  s.version     = ActsAsDict::VERSION
  s.authors     = ["zengjing"]
  s.email       = ["zengjing@damirainfo.com"]
  s.homepage    = "https://github.com/damirainfo/acts_as_dict.git"
  s.summary     = "ActsAsDict."
  s.description = "ActsAsDict."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">=4.1.4"

  s.add_development_dependency "sqlite3"
end
