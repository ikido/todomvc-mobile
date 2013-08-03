#global define, $
define ["marionette", "vent", "templates", "views/ActiveCount"], (Marionette, vent, templates, ActiveCount) ->
  "use strict"
  Marionette.Layout.extend
    template: templates.footer
    regions:
      count: "#todo-count strong"

    ui:
      filters: "#filters a"

    events:
      "click #clear-completed": "onClearClick"
      "click #full-sync": "onFullSyncClick"
      "click #incremental-sync": "onIncrementalSyncClick"

    initialize: ->
      @bindTo vent, "todoList:filter", @updateFilterSelection, this

    onRender: ->
      @count.show new ActiveCount(collection: @collection)

    updateFilterSelection: (filter) ->
      @ui.filters.removeClass("selected").filter("[href=\"#/" + filter + "\"]").addClass "selected"

    onClearClick: ->
      vent.trigger "todoList:clear:completed"
      
    onFullSyncClick: ->
      @collection.storage.sync.full()
      
    onIncrementalSyncClick: ->
      @collection.storage.sync.incremental()

