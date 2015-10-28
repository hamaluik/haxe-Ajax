var express = require('express');
var app = express();

app.set('port', (process.env.PORT || 5000));
app.use(express.static('output'));

app.get('/test', function(req, res, next) {
  res.json({
  	greetings: "Hello world!"
  })
});*/

app.listen(app.get('port'), function() {
  console.log("Sample app is running at localhost:" + app.get('port'))
});