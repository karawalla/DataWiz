require "#{__dirname}/responder"

class Responder.Create extends Responder
  respond: (@req, @res) =>
    console.log "Recieved create"
    category = new Category(@req.param('category'))
    console.log "Category #{category}"
    category.save @complete


