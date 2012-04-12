require 'yaggy/gem'

module Yaggy
  def self.gem(file, options = {})
    @gems ||= []
    @gems << Yaggy::Gem.new(file, options)
  end
end

