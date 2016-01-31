assert = chai.assert
app = null

describe "app", ->
  app = new App()

  describe "dealerTurn", ->
    it "should be a function", ->
      assert.strictEqual typeof app.dealerTurn, 'function'

  describe "declareWinner", ->
    it "should be a function", ->
      assert.strictEqual typeof app.declareWinner, 'function'
