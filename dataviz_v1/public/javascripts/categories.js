// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var request, socket;

    socket = io.connect("/");
    socket.on('newCategory', function(category) {
      return $("#categories").append("<li><a href='#'>" + category.title + "</a></li>");
    });
    socket.on('editStarted', function() {
      return $("#current_edit").text("A new Category has been initiated....");
    });
    request = $.get('/api/categories');
    request.done(function(categories) {
      var category, _i, _len, _ref, _results;

      _ref = categories.reverse();
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        category = _ref[_i];
        _results.push($("#categories").append("<li><a href='#'>" + category.title + "</a></li>"));
      }
      return _results;
    });
    $("#category_name").focus();
    $("#category_name").mouseleave(function() {
      console.log("Edit Started");
      return socket.emit('editStarted');
    });
    $("#category_name").val("Enter a new category");
    return $("#add_new_category").click(function() {
      var category,
        _this = this;

      category = {
        title: $("#category_name").val(),
        base: $("#category_base").val()
      };
      if ((category.title == null) || category.title.trim() === "") {
        return alert("Category title cannot be empty");
      } else {
        request = $.post("/api/categories", {
          category: category
        });
        request.fail(function(response) {
          var message;

          message = JSON.parse(response.responseText).message;
          return alert(message);
        });
        return request.done(function(category) {
          socket.emit('newCategory', category);
          $("#categories").append("<li><a href='#'>" + category.title + "</a></li>");
          return $("#category_name").val("");
        });
      }
    });
  });

}).call(this);
