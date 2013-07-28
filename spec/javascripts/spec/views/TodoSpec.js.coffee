define ["templates","views/TodoItemView", "models/Todo"], (templates, ItemView, Todo) ->

  describe "ItemView", ->    
    
    it "returns the view object", ->
      @model = new Todo({ title: 'some title' })
      @view = new ItemView({ model: @model })
      
      expect(@view.render()).toEqual @view