define ["backbone", "models/Todo", "backbone_offline"], (Backbone, Todo, Offline) ->
  
  "use strict"
  
  isCompleted = (todo) ->
    todo.get "completed"    
  
  Backbone.Collection.extend
    model: Todo
    url: AppConfig.api_server+'/todo_items.json'
    
    initialize: ->
      @storage = new Offline.Storage('todos-backbone', this)
          
    getCompleted: ->
      @filter isCompleted

    getActive: ->
      @reject isCompleted

    comparator: (todo) ->
      todo.get "created"

