require 'umlaut/routes'

# not sure why including openurl gem doesn't do the require, but it
# seems to need this. 
require 'openurl'

module Umlaut
  class Engine < Rails::Engine
    engine_name "umlaut"
    
    # we store some things in non-standard subdirs, add em to path.
    #
    # We EAGER load em all to try and handle threading issues. 
    
    config.autoload_paths << File.join(self.root, "lib", "referent_filters")
    config.eager_load_paths << File.join(self.root, "lib", "referent_filters")
    
    config.autoload_paths << File.join(self.root, "lib", "service_adaptors")
    config.eager_load_paths << File.join(self.root, "lib", "service_adaptors")
    
    # Ane make 'lib' dir auto-loaded, because we have legacy Rails2 code
    # that assumes it.
    config.autoload_paths << File.join(self.root, "lib")
    # Sadly including eager_load_paths here makes weird things happen, apparently
    # I don't entirely understand what's going on. 
    #config.eager_load_paths << File.join(self.root, "lib")
    
    # This makes our rake tasks visible. NOT NEEDED, tasks in lib/tasks
    # are avail by default, this ends up doing a double load. 
    #rake_tasks do
    #  Dir.chdir(File.expand_path(File.join(File.dirname(__FILE__), '..'))) do
    #    Dir.glob(File.join('lib', 'tasks', '*.rake')).each do |railtie|
    #      load railtie
    #    end
    #  end
    #end
  end
end
