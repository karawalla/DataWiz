require('coffee-script');


var express = require('express')
  , http = require('http')
  , stylus = require('stylus')
  , path = require('path');

var app = express();

// all environments
app.use(stylus.middleware(
    {
        src:__dirname +"/views",
        dest:__dirname + "/public"
    }
));
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

console.log("debug");

//Routes
require('./apps/authentication/routes')(app);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
