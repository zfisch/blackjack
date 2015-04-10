# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', new Deck()

    #instantiate Game model
    @set 'game', new Blackjack(collection: @get('deck'))
