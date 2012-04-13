require 'rubygems'
require 'rubygems/specification'

module Yaggy
  class MockSpec
    def method_missing(*args, &block)
    end

    def initialize
      yield self
      @@gems[@@current_file] = self
    end

    attr_reader :version

    def version=(v)
      require 'ruby-debug'
      @version_line = caller.detect { |l| l !~ /#{__FILE__}/ }.split(":")[1]
      @version = v
    end

    attr_accessor :name

    def self.capture_gemspec_info(gemspec)
      @@gems ||= {}
      @@current_file = gemspec
      old_spec = ::Gem::Specification
      ::Gem.const_set("Specification", ::Yaggy::MockSpec)
      load gemspec
      @@gems[@@current_file]
    ensure
      Gem.const_set("Specification", ::Yaggy::MockSpec)
    end
  end
end
