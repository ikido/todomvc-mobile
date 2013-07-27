#global define
define ["vent"], (vent) ->
  
  "use strict"
  
  setFilter: (param) ->
    vent.trigger "todoList:filter", param.trim() or ""
