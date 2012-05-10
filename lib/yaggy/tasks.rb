require 'rake'

namespace :release do
  desc "release a patch revision"
  task :patch do
    Yaggy::Release.release(:patch)
  end

  desc "release a minor revision"
  task :minor do
    Yaggy::Release.release(:minor)
  end

  desc "release a major revision"
  task :major do
    Yaggy::Release.release(:major)
  end
end
desc "release a patch revision"
task :release => "release:patch"
