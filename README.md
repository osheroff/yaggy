# Yet Another Goddamn Gemspec thingY

This is yet another goddamn gemspec thingy.  It does roughly the same stuff as jeweler, 
but it operates on plain vanilla gemfiles, so other devs working with your gems can work with it too, and you can 
just plug it in without rewriting your gemfile.  

## installing

```
# Rakefile
require 'yaggy'

Yaggy.gem('my_gem.gemspec', :push_gem => true)


# more advanced options
Yaggy.gem('my_gem.gemspec', :update_gemfile => "~/src/main_project/Gemfile")

# update_gemfile will update another project's Gemfile to use the current version on release.

```

## tasks

- rake release  # defaults to a patch revision
- rake release:patch
- rake release:minor
- rake release:major





