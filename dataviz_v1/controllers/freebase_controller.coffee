app.get "/", (req, res) ->
  freebase.list 'operating systems', {}, (data)->
      res.render 'index', {title:'DataWiz Home', data:data}

