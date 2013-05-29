global.express = require('express')
global.mediawiki = require('nodemw')
global.freebase = require('freebase')
http = require('http')

global.app = app = express()

server = http.createServer(app).listen('3000')
global.io = require('socket.io').listen(server)



#config
require "#{__dirname}/config/configuration"

#database
require "#{__dirname}/models/database"

#Models
require "#{__dirname}/models/category"

#routes
require "#{__dirname}/controllers/home_controller"
require "#{__dirname}/controllers/categories_controller"

io.sockets.on 'connection', (socket) ->
    socket.on 'newCategory', (category) ->
      console.log "new actegory added #{category}"
      console.log category
      socket.broadcast.emit 'newCategory', category

    socket.on 'editStarted', () ->
      socket.broadcast.emit 'editStarted'


console.log "Server is running on port 3000"

