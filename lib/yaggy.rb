require 'yaggy/gem'

module Yaggy
  def self.gem(file, options = {})
    @gem = Yaggy::Gem.new(file, options)
  end
end

