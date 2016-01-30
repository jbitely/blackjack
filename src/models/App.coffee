# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on "stand", (->
      @dealerTurn()
      return), this
    return

# // method dealer turn
  dealerTurn: ->
#   // flip card
    @get('dealerHand').at(0).flip()
    while @get('dealerHand').minScore() < 17
      @get('dealerHand').hit()
#   // if over 17
#     // if over 21 player win
#     // else stand and determine winner
#   // else hit and recurse
