Gem::Specification.new do |s|
  s.name = "yaggy"
  s.version = "0.1.2"

  s.authors = ["Ben Osheroff"]
  s.date = %q{2012-04-11}
  s.summary = "Yet Another Goddamn Gemspec thingY"
  s.description = ""
  s.email = ["ben@gimbo.net"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
    "lib/yaggy.rb"
  ] + Dir.glob("lib/yaggy/*.rb")

  s.homepage = "http://github.com/osheroff/yaggy"
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.3}

  s.add_development_dependency("rake")
  s.add_development_dependency("bundler")
  s.add_development_dependency("mocha")
  s.add_development_dependency("shoulda")
  s.add_development_dependency("ruby-debug") if RUBY_VERSION < "1.9.0"
end

