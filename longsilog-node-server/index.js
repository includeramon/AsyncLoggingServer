var server = require("./libs/server.js");
var config = require("./config.json");
var host; //redis host, usually its where im running(localhost)
var channel;// redis channel we are listening to
var log_level;// DEBUG or INFO
var path;//log file 

function get_configurations(){
	log_level = config.log_level;
	channel = config.channel;
	host = config.host;
        path = config.path;
} 

get_configurations();
server.start(host,channel,log_level,path);


//TODO TODO
/*
	 - readme
	 - diagram
	 - database cassandra - why? what for? we already have redis
	 - implement client
	 - testing
*/
