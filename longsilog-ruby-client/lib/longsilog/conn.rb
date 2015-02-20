require "redis"

  class Conn
  
    def initialize(target,channel)
		@host = target
		@channel = channel
		@redis = Redis.new(:host => @host, :port => 6379)
    end

    def log(service, severity, message, tags = {}, ts)  
		fullmsg = ":#{service}:#{ts}:#{severity}:#{tags}:#{message}"
		write(fullmsg)
    end

    protected
	
    def write(msg)		
		begin
			@redis.publish(@channel, msg)
		rescue Exception => e
			$stderr.puts "Failed to write to server! " 
		end
    end

  end

