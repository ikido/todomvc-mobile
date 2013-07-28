define (require) ->

  describe 'truth', ->
    it 'should be true', ->
      #loadFixtures('some stuff')
      expect(1 == 1).toBeTruthy()
