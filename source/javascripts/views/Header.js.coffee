#global define
define ["marionette", "templates"], (Marionette, templates) ->
  "use strict"
  Marionette.ItemView.extend
    template: templates.header
    ui:
      input: "#new-todo"

    events:
      "keypress #new-todo": "onInputKeypress"

    onInputKeypress: (evt) ->
      ENTER_KEY = 13
      todoText = @ui.input.val().trim()
      if evt.which is ENTER_KEY and todoText
        @collection.create title: todoText
        @ui.input.val ""

