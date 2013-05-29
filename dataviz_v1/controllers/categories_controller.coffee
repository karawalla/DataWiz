require "#{__dirname}/responders/index_responder"
require "#{__dirname}/responders/create_responder"


app.get "/api/categories", new Responder.Index().respond
app.post "/api/categories", new Responder.Create().respond