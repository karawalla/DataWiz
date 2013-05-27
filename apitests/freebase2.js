var freebase =require('freebase');
var query=[{"/people/person/profession":{"id":"/en/lawyer"},
 "name":null,
 "id":null
}]
freebase.paginate(query, console.log);

