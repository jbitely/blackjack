assert = chai.assert
playerHand = null
dealerHand = null
deck = null

beforeEach ->
  deck = new Deck()
  playerHand = deck.dealPlayer()
  dealerHand = deck.dealDealer()
#   sinon.spy playerHand, 'trigger'

# describe 'triggers', ->

#   describe 'stand', ->
#     it 'should trigger stand event', ->
#       hand.stand()
#       expect(hand.stand).to.have.been.calledWith 'stand', hand

#   describe 'busted', ->
#     it 'should trigger busted event', ->
#       hand.busted()
#       expect(hand.busted).to.have.been.calledWith 'busted', hand

#   describe 'blackjack', ->
#     it 'should trigger blackjack event', ->
#       hand.blackJack()
#       expect(hand.blackJack).to.have.been.calledWith 'blackJack', hand

describe "hand", ->
  describe "player hand", ->
    it 'should create player hand', ->
      assert.strictEqual playerHand.length, 2

  describe "dealer hand", ->
    it 'should create dealer hand', ->
      assert.strictEqual dealerHand.length, 2
    it 'should have the first card flipped', ->
      assert.strictEqual dealerHand.at(0).get('revealed'), false
