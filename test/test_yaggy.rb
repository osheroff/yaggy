require 'rubygems'
require 'bundler'
Bundler.setup

require 'test/unit'
require 'shoulda'
require 'yaggy'

class YaggyTest < Test::Unit::TestCase
  context "with the stats gemspec" do
    setup do
      @gem = Yaggy.gem(File.expand_path("statsgem.gemspec", File.dirname(__FILE__)))
    end

    should "be able to pull the version out" do
      assert_equal "0.6.22", @gem.version
      assert_equal "0", @gem.major
      assert_equal "6", @gem.minor
      assert_equal "22", @gem.patch
    end

    context "rev_patch" do
      should "rev the patch version" do
        @gem.rev_patch!
        assert_equal "23", @gem.patch
      end
    end

    context "write!" do
      should "rewrite the version" do
        @gem.rev_patch!
        @gem.write!
        @new_gem = Yaggy.gem(File.expand_path("statsgem.gemspec", File.dirname(__FILE__)))
        assert_equal("0.6.23", @new_gem.version)
      end
    end
  end
end
