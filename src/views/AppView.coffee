class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="result"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    #listen for dealerturn
    @.listenTo(@.model, 'dealerturn busted blackjack', ->
      @$el.off "click .hit-button")

    # @.listenTo(@.model, 'blackjack', ->
    #   render blackjack image)
      #update $@el.imagediv with image
      #update visibility to not be hidden
      #render

    @.listenTo(@.model, 'playerWin', ->
      @$('.result').html("<img src='img/playerWin.jpg' />").css("visibility", "visible"))
    @.listenTo(@.model, 'dealerWin', ->
      @$('.result').html("<img src='img/dealerWin.jpg' />").css("visibility", "visible"))
    @.listenTo(@.model, 'push', ->
      @$('.result').html("<img src='img/push.png' />").css("visibility", "visible"))
    @.listenTo(@.model, 'blackjack', ->
      console.log 'blackjack'
      @$('.result').html("<img src='img/blackjack.png' />").css("visibility", "visible"))

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

