var fs = require('fs');

function write_to_logfile(path,message){
  fs.appendFile(path, message, function (err){});
}
function log_info(path,message) {
  console.log("on info, message: " + message);
  write_to_logfile(path,message+"\n");
}

function log_debug(path,message) {
  console.log("on debug, message: " + message);
  write_to_logfile(path,message+"\n");
}
  exports.log_info = log_info;
  exports.log_debug = log_debug;

function write_to_database(){ 
   //TODOTODOTODO
}


