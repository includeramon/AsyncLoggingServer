
var redis = require("redis");
var handlers = require("./handlers");
var router = require("./router");
var exec = require("child_process").exec;
var fs = require('fs');

var subscribe;//for client for redis subscribe

var handlers_container = {};
handlers_container["log_debug"] = handlers.log_debug;
handlers_container["log_info"] = handlers.log_info;

function result_running_redis_server(error, stdout, stderr){
  console.log("\n"+ (error!=null)?error:"");
  console.log("\n"+ (stderr!=null)?stderr:"");
  console.log("\n"+ (stdout!=null)?stdout:"");
}

function start_actual_server(){
  cmd = "cd vendor/redis-2.8.19/src && ./redis-server & ";
  exec(cmd, result_running_redis_server);
}

function start(host,channel,log_level,path){
  
  fs.exists(path, function (exists) {
    if(!exists) fs.writeFile(path, 'Initialize log file\n', function (err){});
    });
  start_actual_server();
  subscribe  = redis.createClient(6379,host);
    
  function eventRedis(channel,message){
	router.route(handlers_container, log_level, path, message);
  }
  
  subscribe.on("message", eventRedis);
 
  //subscribe for redis publish from client
  subscribe.subscribe(channel);
  console.log("Server has started.");
}


exports.start = start;
