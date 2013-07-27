define ["marionette"], (marionette) ->
  
  "use strict"
  
  marionette.AppRouter.extend appRoutes:
  
    "*filter": "setFilter"

