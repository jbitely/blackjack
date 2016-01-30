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
    # listen for any busted event
      # call declare winner
    @get('playerHand').on "busted", (->
      @declareWinner("Player", "dealer")
      return), this
    @get('dealerHand').on "busted", (->
      @declareWinner("Dealer", "player")
      return), this
    return

# // method dealer turn
  dealerTurn: ->
#   // flip card
    @get('dealerHand').at(0).flip()
    while @get('dealerHand').minScore() < 17
      @get('dealerHand').hit()
    if @get('dealerHand').minScore() <= 21 then @declareWinner() else return
#
# // if over 17
#     // if over 21 player win
#     // else stand and determine winner
#   // else hit and recurse
  declareWinner: (busted=false, winner=false) ->
    # did someone bust? other player wins
    if busted
      console.log "#{busted} busted, #{winner} wins!"
      # if busted is
    else
      # declare winner
      dealScore = @get('dealerHand').minScore()
      playScore = @get('playerHand').minScore()
      if dealScore > playScore then console.log 'Dealer wins!' else console.log 'Player wins!'
