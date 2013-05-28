client = new mediawiki({
server:'en.wikipedia.org'
path:'/w'
debug:false
acprop:'size'
})



client.getPagesInCategory 'Classes_of_computers', (data) =>
  client.getArticle data[0].title, (data) =>
    res.render "index", {title:"Data Wiz Tool", data:data}