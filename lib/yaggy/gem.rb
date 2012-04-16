require 'yaggy/mock_spec'

module Yaggy
  class Gem
    def initialize(file, options)
      @gemspec = file
      @options = options
      query_gemspec
    end

    def push_gem?
      @options[:push_gem]
    end

    def use_git?
      if @options.key?(:git_ops)
        @options[:git_ops]
      else
        File.directory?(File.dirname(@gemspec) + "/.git")
      end
    end

    def commit!
      system("git add #{@gemspec}")
      system("git commit -m 'version #{version}'")
      system("git tag v#{version}")
      if !%x{git remote}.chomp.empty?
        system("git push")
        system("git push --tags")
      end
    end

    def push!
      output = `gem build #{@gemspec}`
      # todo: some minimal error detection
      system("gem push #{@name}-#{version}.gem")
    end

    def query_gemspec
      mock_spec = Yaggy::MockSpec.capture_gemspec_info(@gemspec)
      version = mock_spec.version
      @version_line = mock_spec.version_line
      @original_version = version
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
      @patch = "0"
    end

    def rev_major!
      @major = (@major.to_i + 1).to_s
      @minor = "0"
      @patch = "0"
    end

    def write!
      lines = File.readlines(@gemspec)
      if lines[@version_line - 1] !~ /#{@original_version}/
        raise "Couldn't find version in gemspec."
      end

      lines[@version_line - 1].sub!(@original_version, version)
      File.open(@gemspec, "w") { |f|
        f.write(lines.join)
      }
    end

    attr_reader :major, :minor, :patch, :name
  end
end
