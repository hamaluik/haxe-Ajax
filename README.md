# haxe-Ajax
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/FuzzyWuzzie/haxe-Ajax/blob/master/LICENSE)

A simple library for firing promise-based 'ajax' requests (useful when interacting with REST APIs).

## Examples

### Loading Data

```haxe
// fire the ajax request
// using GET, to /test
Ajax.request(
    HTTPMethod.GET,
    '/test'
).then(function(res:Response) {
    // alert the user of the response
    Browser.console.log(res.response);
}).catchError(function(err:Dynamic) {
    // if an error comes up, report it!
    Browser.console.error(err);
});
```

### Live Sample

A [live sample](http://FuzzyWuzzie.github.io/haxe-Ajax/) is available which loads data from the server asynchronously.

[1]: https://github.com/nodeca/pako