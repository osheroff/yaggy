require 'yaggy/mock_spec'

module Yaggy
  class Gem
    def initialize(file, options)
      @gemspec = file
      @options = options
      query_gemspec
    end

    def query_gemspec
      mock_spec = Yaggy::MockSpec.capture_gemspec_info(@gemspec)
      version = mock_spec.version
      @version_line = mock_spec.version_line
      @major, @minor, @patch = version.split('.')
      @name = mock_spec.name
    end

    def version
      [major, minor, patch].join('.')
    end

    def rev_patch!
      @patch = (@patch.to_i + 1).to_s
    end

    def rev_minor!
      @minor = (@minor.to_i + 1).to_s
    end

    def rev_major!
      @major = (@major.to_i + 1).to_s
    end
    attr_reader :major, :minor, :patch
  end
end
