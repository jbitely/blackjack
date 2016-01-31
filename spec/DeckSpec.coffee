assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()

  describe "deck constructor", ->
    it "should create a card collection", ->
      assert.strictEqual deck.length, 52

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      hand = deck.dealPlayer()
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

