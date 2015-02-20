# Autoload lib/ folder including all subdirectories
#config.autoload_paths += %W(#{config.root}/lib)
#config.autoload_paths += Dir["#{config.root}/lib/**/"]
module Longsi
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib/**/) # add this line
  end
end
