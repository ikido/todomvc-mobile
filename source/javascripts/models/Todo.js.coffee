define ["backbone", "lib/backbone-localStorage"], (Backbone) ->
  
  "use strict"
  
  Backbone.Model.extend
    localStorage: new Backbone.LocalStorage("todos-backbone")
    defaults:
      title: ""
      completed: false
      created: 0

    initialize: ->
      @set "created", Date.now()  if @isNew()

    toggle: ->
      @set "completed", not @get("completed")