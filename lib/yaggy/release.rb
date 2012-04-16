module Yaggy
  class Release
    class << self
      def release(what)
        gem = Yaggy.current_gem
        gem.send("rev_#{what}!")
        puts("Releasing #{gem.name} version #{gem.version}")
        gem.write!
        if gem.use_git?
          gem.commit!
        end
        if gem.push_gem?
          gem.push!
        end
      end
    end
  end
end


