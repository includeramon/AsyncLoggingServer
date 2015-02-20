function route(handlers_container, log_level, path, message)
{   
	var function_name = "log_"+log_level.toLowerCase();
	
	if (typeof handlers_container[function_name] === 'function') {
		handlers_container[function_name](path,message);
	}
	else{
		//do something
	}
}

exports.route = route;
