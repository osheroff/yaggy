require 'rubygems'
require 'bundler'
Bundler.setup

require 'test/unit'
require 'shoulda'
require 'yaggy'

class YaggyTest < Test::Unit::TestCase
  context "with the stats gemspec" do
    setup do
      @yaggy = Yaggy.gem(File.expand_path("statsgem.gemspec", File.dirname(__FILE__)))
    end

    should "be able to pull the version out" do
      @yaggy.query_gemspec
    end
  end
end
