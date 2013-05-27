https = require('https')

optionsGet = {
  host:'www.googleapis.com'
  port:443
  path:'/freebase/v1/search?q=bob&key=AIzaSyDLeP5l0iH-XPViw9lYT1ePGiqaYn7iZJw'
  method:'GET'
}

reqGet = https.request optionsGet, (res) ->
  console.log "Status Code #{res.statusCode}"
  res.on 'data', (data) ->
    console.log "data:#{data}"


reqGet.end()

reqGet.on 'error', (e) ->
      console.log e





