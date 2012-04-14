module Yaggy
  class Release
    class << self
      def release_patch
        gem = Yaggy.current_gem
        gem.rev_patch!
        gem.write!
        if gem.use_git?
          gem.commit!
        end
      end
    end
  end
end


