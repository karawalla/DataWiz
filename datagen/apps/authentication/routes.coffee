routes = (app) ->
  app.get '/login', (req, res) ->
    res.render "#{__dirname}/views/login",
      title:'Login'


  app.post '/sessions', (req, res) ->
    req.session.currentUser =req.body.user
    console.log req.session.currentUser




module.exports = routes


