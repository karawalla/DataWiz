require "coffee-script"
express = require "express"
less = require "connect-lesscss"
facebook = require "facebook-js"
Sequelize = require 'sequelize'
globals =  require './config'


sequelize = new Sequelize(globals.db.development.database, globals.db.development.username
                          , globals.db.development.password,
                          {
                            host: globals.db.development.host
                            port: globals.db.development.port
                            logging: globals.db.development.logging
                            dialect: globals.db.development.dialect
                            define: {timestamps:true}
                          })
app = express()




app.configure ->
  app.use express.static("#{__dirname}/public")
  app.use "/application.css", less( "#{__dirname}/less/application.less")
  app.use express.bodyParser()
  app.use express.cookieParser()
  app.use express.methodOverride()
  app.use express.session({secret:'helloworld'})
  app.set 'view engine', 'jade'


app.get '/', (req, res) ->
  res.render 'home',
    title:'Code Racer Home'

app.post '/login', (req, res) ->
  res.redirect facebook.getAuthorizeUrl(
    {
      client_id:globals.fb.id
      redirect_uri:"#{globals.url}/authed"
      scope:"email"
    }
  );


  app.get '/authed', (req, res) ->
    console.log "globals.fb.id #{globals.fb.id}"
    console.log "globals.url/authed #{globals.url}/authed"

    facebook.getAccessToken globals.fb.id, globals.fb.secret, req.param('code'), "#{globals.url}authed", (error, accessToken, refreshToken) ->
      req.session.accessToken = accessToken
      req.session.refreshToken = refreshToken

      console.log "accessToken:#{req.session.accessToken}"
      console.log "refreshToken:#{req.session.refreshToken}"


      res.redirect '/fbstatus'


  app.get '/fbstatus', (req, res) ->
    console.log "accessToken:#{req.session.accessToken}"
    console.log "refreshToken:#{req.session.refreshToken}"

    facebook.apiCall 'GET', '/me', {access_token:req.session.accessToken}, (err, resp, body) ->
      res.send body



io = require('socket.io').listen(app.listen(3000))


io.sockets.on 'connection', (socket) ->
  socket.emit 'message', {message: 'welcome to the chat'}
  socket.on 'send', (data) ->
    io.sockets.emit 'message', data




console.log "server is listening"