require 'yaggy/mock_spec'

module Yaggy
  class Gem
    def initialize(file, options)
      @gemspec = file
      @options = options
    end

    def query_gemspec
      mock_spec = Yaggy::MockSpec.capture_gemspec_info(@filename)
      version = mock_spec.version
      version_line = mock_spec.version_line
      @major, @minor, @patch = version.split('.')
      @name = mock_spec.name
    end

    def bump_patch
    end
  end
end
