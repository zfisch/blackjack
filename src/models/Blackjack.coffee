class window.Blackjack extends Backbone.Model

  initialize: ->
    #add game logic here
    debugger;
    @set 'deck', new Deck()
    @set 'playerHand', @.get('deck').dealPlayer([@.get('deck').pop(), @.get('deck').pop()])
    @set 'dealerHand', @.get('deck').dealDealer([@.get('deck').pop().flip(), @.get('deck').pop()])
