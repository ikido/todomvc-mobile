#global define
define ["marionette", "templates", "vent", "views/TodoItemView"], (Marionette, templates, vent, ItemView) ->
  "use strict"
  Marionette.CompositeView.extend
    template: templates.todosCompositeView
    itemView: ItemView
    itemViewContainer: "#todo-list"
    ui:
      toggle: "#toggle-all"

    events:
      "click #toggle-all": "onToggleAllClick"

    initialize: ->
      @bindTo @collection, "all", @updateToggleCheckbox, this

    onRender: ->
      @updateToggleCheckbox()

    updateToggleCheckbox: ->
      reduceCompleted = (left, right) ->
        left and right.get("completed")
      allCompleted = @collection.reduce(reduceCompleted, true)
      @ui.toggle.prop "checked", allCompleted

    onToggleAllClick: (evt) ->
      isChecked = evt.currentTarget.checked
      @collection.each (todo) ->
        todo.save completed: isChecked


