app.configure ->
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()
  app.use express.session(secret:'hello world')
#  app.set 'view engine', 'jade'
  app.use app.router
  app.use express.static("#{__dirname}/../public")
  app.use express.errorHandler(dumpExceptions:true, showStack:true)