# AsyncLoggingServer

Longsilog

Longsilog is composed of two applications:
1. Server - This is a simple node.js server which accepts logs through the redis server.
2. Client - This is a simple ruby rails gem that can send message logs to the server to #1.
Both simply "clients" to redis' subscribe/publish messaging pattern implmentation(http://redis.io/topics/pubsub) . Using redis available client bindings(http://redis.io/clients).
Server Installation/configuration
	This was written using node v0.10.35
1.	Install redis client – npm install redis (https://github.com/mranney/node_redis) 
2.	Copy longsilog-node-server/* to the server machine.
3.	Configure longsilog-node-server/config.json
	"channel" : "logging",
	"host" : "127.0.0.1",
	"path" : "/var/log/log.txt" //logfile path
4.	run “node index.js”
5.	The server will run and this will log to the standard output streams or to the current console and also to the log file specified.

	NOTE: root privelege is needed to create the file log.
	Client installation/configuration
	This was written using ruby 2.2.0p0 and Rails 4.2.0. These were all installed/configured using RVM.
1.)	Copy longsilog-ruby-client/* to the client machine.
2.)	Install gem file : gem install longsilog-1.0.0.gem (or build it first: gem build longsilog.gemspec)
NOTE: This will also install redis client binding for ruby as dependency (https://github.com/redis/redis-rb) 
3.)	Usage : 
require 'longsilog'
log = Logger.new('thread', '127.0.0.1', 'logging')
log.warn ("log message")
log.info (“log message”, :tags => [ :tag1, :tag2 ])



Server output:
[3702] 20 Feb 17:53:33.402 # Warning: no config file specified, using the default config. In ord
[3702] 20 Feb 17:53:33.403 # You requested maxclients of 10000 requiring at least 10032 max file
[3702] 20 Feb 17:53:33.403 # Redis can't set maximum open files to 10032 because of OS error: Op
[3702] 20 Feb 17:53:33.403 # Current maximum open files is 1024. maxclients has been reduced to
[3702] 20 Feb 17:53:33.403 # Creating Server TCP listening socket *:6379: bind: Address already

on debug, message: :thread:2015-02-20 17:55:56 +0800:WARN:{}:log message
on debug, message: :thread:2015-02-20 17:56:05 +0800:DEBUG:{}:log message
TODO TODO TODO TODO
-	Server startup sometimes fails – need to change from async call to sync.
-	Add more error handling
-	Enhance log file handling , e.g. root users needed to run server.
-	Optimization all throughout

