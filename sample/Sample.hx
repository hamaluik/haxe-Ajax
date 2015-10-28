import js.html.Ajax;
import js.Browser;
import js.html.Element;

class Sample {
	static public function main() {
		// find the container which will hold the results
		var container:Element = Browser.document.getElementsByTagName('pre')[0];

		// fire the ajax request
		// using GET, to /test
		Ajax.request(
			HTTPMethod.GET,
			'./test'
		).then(function(res:Response) {
			// set the container's text to our response
			container.innerText = res.response;
		}).catchError(function(err:Dynamic) {
			// if an error comes up, report it!
			Browser.console.error(err);
		});
	}
}