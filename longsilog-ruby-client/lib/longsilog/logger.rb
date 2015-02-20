require 'longsilog/client'

  class Logger < Client
  
	alias_method :client_log, :log
	
    def initialize(*args)
      super(*args)
    end
   
    def info(message = nil, tags = {})
      add("INFO", message, tags)
    end
   
    def debug(message = nil, tags = {})
      add("DEBUG", message, tags)
    end

    def error(message = nil, tags = {})
      add("ERROR", message, tags)
    end

    def fatal(message = nil, tags = {})
      add("FATAL", message, tags)
    end

    def warn(message = nil, tags = {})
      add("WARN", message, tags)
    end
	
    def add(severity, message = nil, tags = {})
      client_log(severity,message,tags)
    end
	
 end

