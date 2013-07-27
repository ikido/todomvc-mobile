#global define
define ["marionette"], (Marionette) ->
  "use strict"
  Marionette.View.extend
    tagName: "span"
    initialize: ->
      @bindTo @collection, "all", @render, this

    render: ->
      @$el.html @collection.getActive().length

