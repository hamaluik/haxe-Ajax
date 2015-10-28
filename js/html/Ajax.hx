package js.html;

import js.html.XMLHttpRequest;
import promhx.Promise;
import promhx.Deferred;

@:enum
abstract HTTPMethod(String) from String to String {
	var GET = "GET";
	var POST = "POST";
	var PUT = "PUT";
	var DELETE = "DELETE";
}

typedef Response = {
	var status:Int;
	var response:Dynamic;
	var xhr:XMLHttpRequest;
};

class Ajax {
	private static function res(xhr:XMLHttpRequest):Response {
		return {
			status: xhr.status,
			response: xhr.response,
			xhr: xhr
		};
	}

	public static function request(method:HTTPMethod, url:String, ?data:Dynamic):Promise<Response> {
		var def = new Deferred<Response>();
		var prom = def.promise();

		var xhr:XMLHttpRequest = new XMLHttpRequest();
		xhr.open(method, url, true);
		xhr.onload = function() {
			if(xhr.status >= 200 && xhr.status < 300) {
				def.resolve(res(xhr));
			}
			else {
				def.throwError(res(xhr));
			}
		};
		var error = function() {
			def.throwError(res(xhr));
		};
		xhr.onerror = error;
		xhr.onabort = error;
		xhr.ontimeout = error;
		if(data != null) {
			xhr.send(data);
		}
		else {
			xhr.send();
		}

		return prom;
	}
}