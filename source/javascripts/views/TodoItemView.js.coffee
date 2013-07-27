#global define
define ["marionette", "templates"], (Marionette, templates) ->
  "use strict"
  Marionette.CompositeView.extend
    tagName: "li"
    template: templates.todoItemView
    ui:
      edit: ".edit"

    events:
      "click .destroy": "destroy"
      "dblclick label": "onEditClick"
      "keypress .edit": "onEditKeypress"
      "click .toggle": "toggle"

    initialize: ->
      @bindTo @model, "change", @render, this

    onRender: ->
      @$el.removeClass "active completed"
      if @model.get("completed")
        @$el.addClass "completed"
      else
        @$el.addClass "active"

    destroy: ->
      @model.destroy()

    toggle: ->
      @model.toggle().save()

    onEditClick: ->
      @$el.addClass "editing"
      @ui.edit.focus()

    onEditKeypress: (evt) ->
      ENTER_KEY = 13
      todoText = @ui.edit.val().trim()
      if evt.which is ENTER_KEY and todoText
        @model.set("title", todoText).save()
        @$el.removeClass "editing"

