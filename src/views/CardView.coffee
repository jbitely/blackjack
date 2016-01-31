class window.CardView extends Backbone.View
  className: 'card'
  # template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<img src=img/cards/<%= rankName %>-<%= suitName %>.png>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    @$el.children().addClass 'hidecard' unless @model.get 'revealed'
