#!/usr/bin/env rackup

require 'bundler'
# The following ensures that not only has Bundler modified the load-path to
# include the libdirs of all gems in the Gemfile, but that the lib-file (in our
# case, loveos-chunky_bacon.rb) is also required. Hence the naming convention.
Bundler.require

# Assuming we used proper file names (loveos/chunky_bacon/service.rb), the
# constant LoveOS::ChunkyBacon exists already, and LoveOS::ChunkyBacon::Service
# will be autoloaded.
run LoveOS::ChunkyBacon::Service
