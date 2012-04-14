require 'rake'

namespace :release do
  task :patch do
    Yaggy::Release.release(:patch)
  end
  task :minor do
    Yaggy::Release.release(:minor)
  end
  task :major do
    Yaggy::Release.release(:major)
  end
end
task :release => "release:patch"
