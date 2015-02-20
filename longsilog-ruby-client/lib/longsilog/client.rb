require 'longsilog/conn'

  class Client

    def initialize(service = 'default', target = '127.0.0.1', channel = "logging")
      @service = service.to_s
      @conn = Conn.new(target,channel)
    end
		
    def log(severity, msg, tags = {}, ts = nil)
      conn_log(severity, msg, tags, ts)
    end
	
    protected

    def conn_log(severity, msg, tags = {}, ts = nil)
      ts = Time.now if ts.nil?
      @conn.log(@service, severity, msg, tags, ts)
    end
	
  end

