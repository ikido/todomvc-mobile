define ["backbone"], (Backbone) ->
  
  "use strict"
  
  Backbone.Model.extend
    defaults:
      title: ""
      completed: false
      created: 0

    initialize: ->
      @set "created", Date.now()  if @isNew()
      @on 'change', ->
        @updated_at = new Date();
      , @

    toggle: ->
      @set "completed", not @get("completed")