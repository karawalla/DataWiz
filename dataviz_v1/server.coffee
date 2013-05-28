global.express = require('express')
global.mediawiki = require('nodemw')
global.freebase = require('freebase')
http = require('http')

global.app = app = express()

server = http.createServer(app).listen('3000')
global.io = io = require('socket.io').listen(server)



#config
require "#{__dirname}/config/configuration"

#routes
require "#{__dirname}/controllers/test_controller"

io.sockets.on 'connection', (socket) ->
  socket.on 'ping', (data) ->
    console.log 'socket:server recieves ping'
    socket.emit 'pong', data
    console.log 'socket:server sends pong'

    socket.on 'drawCircle', (data, session) ->
      console.log "session #{session} drew"
      console.log data

      socket.broadcast.emit 'drawCircle', data


console.log "Server is running on port 3000"

