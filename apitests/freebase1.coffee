freebase = require 'freebase'

query = [
  {
    "/people/person/profession":{"id" : "/en/lawyer"},
    "name":null,
    "id":null
  }
]

###

console.log freebase.sentence('tom cruise')
freebase.notable "canada", {}, console.log
freebase.paginate query, console.log

freebase.related 'india', {}, (r) ->
  console.log r.map((v) -> v.name)
###

console.log freebase.sentence "tokyo", {}, console.log






