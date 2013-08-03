# additional required can live here, but we don't need them sice
# we're using require.js
require.config
  paths:
    underscore: "lib/underscore"
    backbone: "lib/backbone"
    marionette: "lib/backbone.marionette"
    jquery: "lib/jquery.min"
    tpl: "lib/tpl"
    'backbone_offline': 'lib/backbone_offline'

  shim:
    'backbone_offline':
      deps: ['underscore', 'backbone']
      exports: 'Offline'

    underscore:
      exports: "_"

    backbone:
      exports: "Backbone"
      deps: ["jquery", "underscore"]

    marionette:
      exports: "Backbone.Marionette"
      deps: ["backbone"]

  deps: ["jquery", "underscore"]

require ["app", "jquery", "backbone", "routers/index", "controllers/index"], (app, $, Backbone, Router, Controller) ->
  "use strict"

  $.ajaxSetup
    headers:
      "X-Requested-With": "XMLHttpRequest"
      "Access-Control-Allow-Credentials": "true"
    crossDomain: true

  app.start()
  new Router(controller: Controller)
  Backbone.history.start()
  
  