require 'yaggy/gem'
require 'yaggy/release'
require 'yaggy/tasks'

module Yaggy
  def self.gem(file, options = {})
    @gem = Yaggy::Gem.new(file, options)
  end

  def self.current_gem
    @gem
  end
end

