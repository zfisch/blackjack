class window.Blackjack extends Backbone.Model



  initialize: ->
    #add game logic here
    @set 'playerHand', @collection.dealPlayer([@collection.pop(), @collection.pop()])
    @set 'dealerHand', @collection.dealDealer([@collection.pop().flip(), @collection.pop()])
