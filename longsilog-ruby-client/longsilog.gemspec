
Gem::Specification.new do |s|
  s.name        = 'longsilog'
  s.version     = '1.0.0'
  s.date        = '2015-02-09'
  s.summary     = "logger - longsilog"
  s.description = "a very simple client for redis logging"
  s.authors     = ["Ramon Damuag"]
  s.email       = "ramonanderson.damuag@gmail.com"
  s.executables = ["longsilog"]
  s.files       = ["bin/longsilog","config/application.rb","lib/longsilog/client.rb","lib/longsilog/conn.rb","lib/longsilog/logger.rb","lib/longsilog.rb"]
  s.add_runtime_dependency "redis", [">= 3.2.0"]
end
