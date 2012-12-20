# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# When this file is included by Rubygems (that includes Bundler), then the
# load-path will have our lib directory. If you plan to use anything in here
# outside of Rubygems, you'll need to explicitly require it.

require 'loveos/chunky_bacon/version'

Gem::Specification.new do |gem|
  gem.name          = "loveos-chunky_bacon"
  gem.version       = LoveOS::ChunkyBacon::VERSION
  gem.authors       = ["DaWanda GmbH"]
  gem.email         = ["dev@dawanda.com"]
  gem.description   = %q{A LoveOS client and server}
  gem.summary       = %q{Adds ChunkyBacon power to LoveOS}
  gem.homepage      = "http://github.com/dawanda/loveos-chunky-bacon.git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^test/})
  gem.require_paths = ["lib"]

  # Requirements for building and testing locally...
  gem.add_development_dependency "sinatra"
  gem.add_development_dependency "fakeweb"

  # Requirements to run the client.
  # All LoveOS gems will probably use this...
  # gem.add_dependency "loveos-common"
end
