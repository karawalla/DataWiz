$ ->
   socket = io.connect("/")

   socket.on 'newCategory', (category) ->
     $("#categories").append("<li><a href='#'>#{category.title}</a></li>")

   socket.on 'editStarted', () ->
    $("#current_edit").text("A new Category has been initiated....")


   request = $.get('/api/categories')
   request.done (categories) ->
     for category in categories.reverse()
       $("#categories").append("<li><a href='#'>#{category.title}</a></li>")



   $("#category_name").focus()
   $("#category_name").mouseleave ->
     console.log "Edit Started"
     socket.emit 'editStarted'

   $("#category_name").val("Enter a new category")

   $("#add_new_category").click ->
     category = {
      title: $("#category_name").val()
      base: $("#category_base").val()
     }

     if !category.title? or category.title.trim() is ""
       alert "Category title cannot be empty"
     else
       request = $.post "/api/categories", category:category
       request.fail (response) =>
         message = JSON.parse(response.responseText).message
         alert message

       request.done (category) =>
         socket.emit 'newCategory', category
         $("#categories").append("<li><a href='#'>#{category.title}</a></li>")
         $("#category_name").val("")



