mediawiki = require('nodemw')

client = new mediawiki({
  server:'en.wikipedia.org'
  path:'/w'
  debug:false
  acprop:'size'
})



client.getPagesInCategory 'Classes_of_computers', (data) =>
 # console.log JSON.stringify(data, null, '\t')

  client.getArticle data[0].title, (data) =>
    console.log data

  console.log "for " + data[0].title









