module LoveOS # :nodoc:
  # The top level namespace - just makes other modules/namespaces available
  # Normally, this RDoc would contain more useful information, as, besides the
  # README, this is the starting point for understanding the whole ChunkyBacon
  # library and philosophy.
  module ChunkyBacon
    autoload :VERSION, 'loveos/chunky_bacon/version'
    autoload :Fox, 'loveos/chunky_bacon/fox'
    autoload :Service, 'loveos/chunky_bacon/service'
    autoload :Client, 'loveos/chunky_bacon/client'
    autoload :CLI, 'loveos/chunky_bacon/cli'
  end
end

