#global $
define ["marionette", "vent", "collections/TodoList", "views/Header", "views/TodoListCompositeView", "views/Footer"], (marionette, vent, TodoList, Header, TodoListCompositeView, Footer) ->
  "use strict"
  app = new marionette.Application()
  todoList = new TodoList()
  app.bindTo todoList, "all", ->
    if todoList.length is 0
      app.main.$el.hide()
      app.footer.$el.hide()
    else
      app.main.$el.show()
      app.footer.$el.show()

  app.addRegions
    header: "#header"
    main: "#main"
    footer: "#footer"

  app.addInitializer ->
    viewOptions = collection: todoList
    app.header.show new Header(viewOptions)
    app.main.show new TodoListCompositeView(viewOptions)
    app.footer.show new Footer(viewOptions)
    todoList.fetch()

  vent.on "todoList:filter", (filter) ->
    filter = filter or "all"
    $("#todoapp").attr "class", "filter-" + filter

  vent.on "todoList:clear:completed", ->
    destroy = (todo) ->
      todo.destroy()
    todoList.getCompleted().forEach destroy

  app
