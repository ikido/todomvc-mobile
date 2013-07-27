define ["backbone", "models/Todo", "lib/backbone-localStorage"], (Backbone, Todo) ->
  
  "use strict"
  
  isCompleted = (todo) ->
    todo.get "completed"    
  
  Backbone.Collection.extend
    model: Todo
    localStorage: new Backbone.LocalStorage("todos-backbone")
    getCompleted: ->
      @filter isCompleted

    getActive: ->
      @reject isCompleted

    comparator: (todo) ->
      todo.get "created"

