global.express = require 'express'
global.freebase = require 'freebase'

global.app = app = express()

global.io = require('socket.io').listen(app)


# Config
require "#{__dirname}/config/configuration"

# Database
require "#{__dirname}/models/database"

# Models
require "#{__dirname}/models/todo"

# Routes
require "#{__dirname}/controllers/home_controller"
#require "#{__dirname}/controllers/todos_controller"



app.listen(3000)

console.log "Server running on port 3000"

