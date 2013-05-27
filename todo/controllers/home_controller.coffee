commands = {
  "search" : freebase.search
  "sentence": freebase.sentence
  "related": freebase.related

}


exec_func = (req, res, command) =>
  res.on "data", (data) ->
    console.log "coooool:" + data

  command req.params.sentence , {max:1}, (desc) ->
    res.send(desc)




app.get '/:command/:sentence', (req, res) ->
  console.log req.params.command

  if commands[req.params.command]?
    exec_func req, res, commands[req.params.command]
  else
    res.send "Invalid command:" + commands.keys
  #res.send "Running command....."
