module Yaggy
  class MockSpec
    def method_missing(*args, &block)
    end

    def initialize
      yield self
      @@gems[@@current_file] = self
    end

    attr_accessor :version, :name

    def self.capture_gemspec_info(gemspec)
      @@current_file = gemspec
      old_spec = Gem::Specification
      Gem.const_set("Specification", ::MockSpec)
      load gemspec
      @@gems[@@current_file]
    ensure
      Gem.const_set("Specification", ::MockSpec)
    end
  end
end
