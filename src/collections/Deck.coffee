class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: (startingHand) -> new Hand startingHand, @

  dealDealer: (startingHand) -> new Hand startingHand, @, true
