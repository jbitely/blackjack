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
    @get('playerHand').on "busted", (->
      @declareWinner("dealer")
      return), this
    @get('playerHand').on "blackjack", (->
      @.trigger 'blackjack'
      return), this
    @get('dealerHand').on "busted", (->
      @declareWinner("player")
      return), this
    return

# // method dealer turn
  dealerTurn: ->
#   trigger dealerturn event
    @.trigger('dealerturn')
#   // flip card
    @get('dealerHand').at(0).flip()
    while @get('dealerHand').minScore() < 17
      @get('dealerHand').hit()
    if @get('dealerHand').minScore() <= 21 then @declareWinner() else return
#
# if over 17
#  if over 21 player win
#  else stand and determine winner
#  else hit and recurse
  declareWinner: (winner=false) ->
    # did someone bust? other player wins
    if winner
      #trigger winnner event
      @.trigger("#{winner}Win")
    else
      # determine winner
      dealScore = @get('dealerHand').minScore()
      playScore = @get('playerHand').minScore()
      if dealScore is playScore
        @.trigger("push")
      else if dealScore > playScore
        @.trigger("dealerWin")
      else
        @.trigger("playerWin")
