Gem::Specification.new do |s|
  s.name = "statsgem"
  s.version = "0.6.22"

  s.authors = ["Ben Osheroff"]
  s.date = "2011-04-21"
  s.email = "ben@zendesk.com"
  s.files = Dir["'lib/**/*"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.5.2"
  s.summary = "Stats for people who love Stats and such."

  s.add_runtime_dependency("mongo", "= 1.5.2")
  s.add_runtime_dependency("redis", ">= 0")
  s.add_runtime_dependency("bson", "= 1.5.2")
  s.add_runtime_dependency("bson_ext", "= 1.5.2")
  # s.add_runtime_dependency("SystemTimer", ">= 0") if Gem::Version.new(RUBY_VERSION.dup) < Gem::Version.new("1.9")
  s.add_development_dependency("rake", ">= 0")
end
