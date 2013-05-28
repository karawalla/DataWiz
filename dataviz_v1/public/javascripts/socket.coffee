io = io.connect('/');

console.log "socket:browser says ping (1)"

io.emit 'ping', {some:'data'}

io.on 'pong', (data) ->
  console.log "socket:browser receives pong #{data}"
